const cds=require('@sap/cds')
module.exports = cds.service.impl(async function () {
    const { States, Business_Partner } = this.entities;
    this.on("READ", Business_Partner, async (req) => {
        const results = await cds.run(req.query);
        return results;
      });
    this.before("CREATE",  Business_Partner, async (req) => {
        const {  businesspartner_number,  is_gstn_reg, Gst_num } = req.data;
        if ( is_gstn_reg && !Gst_num) {
            req.error({
                code: "MISSING_GST_NUM",
                message: "GSTIN number is mandatory when  is_gstn_reg is true",
                target: "Gst_num",
            });
        }
        const query1 = SELECT.from( Business_Partner).where({  businesspartner_number: req.data. businesspartner_number });
        const result = await cds.run(query1); 
        if (result.length > 0) {
          req.error({
            code: "STEMAILEXISTS",
            message: " already exists",
            target: " businesspartner_number",
          });
        }
        
      });
      this.on('READ',States,async(req)=>{
        genders=[
           
            {"code":"AP","description":"Andra Pradesh"},
            {"code":"TN","description":"Tamil Nadu"},
        ]
        genders.$count=genders.length
        return genders;
    })
})
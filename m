Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF4172D9CB
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Jun 2023 08:23:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CBB5C6A615;
	Tue, 13 Jun 2023 06:23:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92713C6A60F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 06:23:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D2w8oJ003888; Tue, 13 Jun 2023 08:23:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GEI2iOXjl27NjjyQRXUvSkmqXkdfjSpBu8CmcW8CmvY=;
 b=CkIQjpLQ2dQL5naMdlhhvifImvQLBMgGENQecoHjiemAHYi03QmLseOEti03b0NbrnjT
 4HWTSjDIL2AcQnqD0fhwunPBdzWljgkMnxrrjYRh9Wwa9pIuO6N82RzfuqvTssgCU0Hg
 7LKuO/WsjZLb/P4lS2jWF9Zm82+y+Y/B9lMSQGKCbMTI8+E/aNd2M+5Xec+frsqg7/+N
 mNRzd2DQ9oN2NzjxVRhGnzXjb4D1KvGKoNhEf8RdWBzUsbKnpPZkhkalYb9NffQ1i3is
 H4cXhrz0q2Q8bQhFBKSa7XBNVNDUO3iroMhXhBJMmoSb7urRv25yDEc1GzbynhzgYhNu ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r6g4xgumt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 08:23:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A35E10002A;
 Tue, 13 Jun 2023 08:23:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62B1520FA53;
 Tue, 13 Jun 2023 08:23:19 +0200 (CEST)
Received: from [10.201.20.56] (10.201.20.56) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 08:23:19 +0200
Message-ID: <b3044d32-02ed-1955-bb64-4968dff18c4b@foss.st.com>
Date: Tue, 13 Jun 2023 08:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
 <20230608171614.4.Ib033df552a0517a23e3fa74a4468ec5126775e93@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230608171614.4.Ib033df552a0517a23e3fa74a4468ec5126775e93@changeid>
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_03,2023-06-12_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 04/12] stm32mp: stm32prog: Remove usage of
 "mtdparts" function
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



On 6/8/23 17:16, Patrick Delaunay wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Motivation for this patch is to remove usage of function define
> in cmd/mtdparts.c interface, based on env variables mtdids and mtdparts:
> mtdparts_init() and find_dev_and_part().
> See commit 938db6fe5da3 ("cmd: mtdparts: describe as legacy")
> 
> Now, all MTD devices are populated with their partition's information
> found in DT, accessible in MTD devices. Use these information to find
> the wanted partitions, no more need of find_dev_and_part() usage.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 42 +++++++++----------
>  1 file changed, 19 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 6f3641ccf57b..241ad40abb7c 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -208,11 +208,6 @@ static int optee_ta_invoke(struct stm32prog_data *data, int cmd, int type,
>  	return rc;
>  }
>  
> -/* partition handling routines : CONFIG_CMD_MTDPARTS */
> -int mtdparts_init(void);
> -int find_dev_and_part(const char *id, struct mtd_device **dev,
> -		      u8 *part_num, struct part_info **part);
> -
>  char *stm32prog_get_error(struct stm32prog_data *data)
>  {
>  	static const char error_msg[] = "Unspecified";
> @@ -741,6 +736,7 @@ static int init_device(struct stm32prog_data *data,
>  	struct mmc *mmc = NULL;
>  	struct blk_desc *block_dev = NULL;
>  	struct mtd_info *mtd = NULL;
> +	struct mtd_info *partition;
>  	char mtd_id[16];
>  	int part_id;
>  	int ret;
> @@ -749,6 +745,7 @@ static int init_device(struct stm32prog_data *data,
>  	u64 part_addr, part_size;
>  	bool part_found;
>  	const char *part_name;
> +	u8 i;
>  
>  	switch (dev->target) {
>  	case STM32PROG_MMC:
> @@ -793,10 +790,11 @@ static int init_device(struct stm32prog_data *data,
>  			stm32prog_err("unknown device type = %d", dev->target);
>  			return -ENODEV;
>  		}
> +		/* register partitions with MTDIDS/MTDPARTS or OF fallback */
> +		mtd_probe_devices();
>  		get_mtd_by_target(mtd_id, dev->target, dev->dev_id);
>  		log_debug("%s\n", mtd_id);
>  
> -		mtdparts_init();
>  		mtd = get_mtd_device_nm(mtd_id);
>  		if (IS_ERR(mtd)) {
>  			stm32prog_err("MTD device %s not found", mtd_id);
> @@ -943,25 +941,23 @@ static int init_device(struct stm32prog_data *data,
>  		}
>  
>  		if (IS_ENABLED(CONFIG_MTD) && mtd) {
> -			char mtd_part_id[32];
> -			struct part_info *mtd_part;
> -			struct mtd_device *mtd_dev;
> -			u8 part_num;
> -
> -			sprintf(mtd_part_id, "%s,%d", mtd_id,
> -				part->part_id - 1);
> -			ret = find_dev_and_part(mtd_part_id, &mtd_dev,
> -						&part_num, &mtd_part);
> -			if (ret != 0) {
> -				stm32prog_err("%s (0x%x): Invalid MTD partition %s",
> -					      part->name, part->id,
> -					      mtd_part_id);
> +			i = 0;
> +			list_for_each_entry(partition, &mtd->partitions, node) {
> +				if ((part->part_id - 1) == i) {
> +					part_found = true;
> +					break;
> +				}
> +				i++;
> +			}
> +			if (part_found) {
> +				part_addr = partition->offset;
> +				part_size = partition->size;
> +				part_name = partition->name;
> +			} else {
> +				stm32prog_err("%s (0x%x):Couldn't find part %d on device mtd %s",
> +					      part->name, part->id, part->part_id, mtd_id);
>  				return -ENODEV;
>  			}
> -			part_addr = mtd_part->offset;
> -			part_size = mtd_part->size;
> -			part_name = mtd_part->name;
> -			part_found = true;
>  		}
>  
>  		/* no partition for this device */
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 163CD2517E1
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Aug 2020 13:41:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF09EC32EA7
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Aug 2020 11:41:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B7FEC32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Aug 2020 11:41:10 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07PBQars020348; Tue, 25 Aug 2020 13:40:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Ot8SzKmtPm5A6JMae29SZ1BbY82uzJzDEazNWMUmE4U=;
 b=gsx/NAy1GteqtNPNJySsAasMk16u5fYJ+8Dh+1b6JbAS3FXNYwFz3eJc0UpBHPkVHCk3
 VIfnA4cXJp19IyO2JqgHZmOeM+/roEVVQAFI9OEU0YzIH/C9GFkvNFsjAuhhIYhRNKVj
 k0G4RbppRIdc2+xJ0fDUAjcENZ7K0POkA2rypCx9NzSqJE+HP5myWrhwPuXdVEzSJ6Hz
 btuU07taJ0RkjrBtHInoNOVvWwfedb6L5CTZKJv1KMEFYhsnTerLb0t8CnPDLT+DyT0B
 KPhR7ZfpVOqmwhejEhrr7zQgRbufFY64juthe/Ivf3SsWlYciYG0pAGgHg/FrEIx1O6F Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 333b6x2pwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 13:40:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD56B10002A;
 Tue, 25 Aug 2020 13:40:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8356A2AAEB9;
 Tue, 25 Aug 2020 13:40:47 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug
 2020 13:40:46 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 25 Aug 2020 13:40:47 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 1/3] fdtdec: optionally add property no-map to created
 reserved memory node
Thread-Index: AQHWetLnrhsf1mz4K0+RyB89MoJXGqlIkfSA
Date: Tue, 25 Aug 2020 11:40:46 +0000
Message-ID: <1c096824-aa71-4b78-6957-8f7b53055292@st.com>
References: <20200825132839.v2.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
In-Reply-To: <20200825132839.v2.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <8798E53F69976E4B85507E26F0345BD1@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-25_02:2020-08-25,
 2020-08-25 signatures=0
Cc: Etienne CARRIERE <etienne.carriere@st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Bin Meng <bin.meng@windriver.com>, Rick Chen <rick@andestech.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Atish Patra <atish.patra@wdc.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] fdtdec: optionally add property
 no-map to created reserved memory node
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

There is an issue with series-changes tag, i will resend a v3


On 8/25/20 1:28 PM, Patrice Chotard wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
>
> Add boolean input argument @no_map to helper function
> fdtdec_add_reserved_memory() to add "no-map" property for an added
> reserved memory node. This is needed for example when the reserved
> memory relates to secure memory that the dear Linux kernel shall
> not even map unless what non-secure world speculative accesses of the
> CPU can violate the memory firmware configuration.
>
> No function change. A later change will update to OPTEE library to
> add no-map property to OP-TEE reserved memory nodes.
>
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>    - fix dm fdtdec test and arch/riscv/lib/fdt_fixup.c with
>    fdtdec_add_reserved_memory() new parameter
>
> ---
>
> (no changes since v1)
>
>  arch/riscv/lib/fdt_fixup.c |  2 +-
>  include/fdtdec.h           |  5 +++--
>  lib/fdtdec.c               | 10 ++++++++--
>  lib/optee/optee.c          |  2 +-
>  test/dm/fdtdec.c           |  6 +++---
>  5 files changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/lib/fdt_fixup.c b/arch/riscv/lib/fdt_fixup.c
> index 5b2420243f..d02062fd5b 100644
> --- a/arch/riscv/lib/fdt_fixup.c
> +++ b/arch/riscv/lib/fdt_fixup.c
> @@ -75,7 +75,7 @@ int riscv_fdt_copy_resv_mem_node(const void *src, void *dst)
>  		pmp_mem.start = addr;
>  		pmp_mem.end = addr + size - 1;
>  		err = fdtdec_add_reserved_memory(dst, basename, &pmp_mem,
> -						 &phandle);
> +						 &phandle, false);
>  		if (err < 0 && err != -FDT_ERR_EXISTS) {
>  			log_err("failed to add reserved memory: %d\n", err);
>  			return err;
> diff --git a/include/fdtdec.h b/include/fdtdec.h
> index bc79389260..f127c7d386 100644
> --- a/include/fdtdec.h
> +++ b/include/fdtdec.h
> @@ -1016,7 +1016,7 @@ static inline int fdtdec_set_phandle(void *blob, int node, uint32_t phandle)
>   *     };
>   *     uint32_t phandle;
>   *
> - *     fdtdec_add_reserved_memory(fdt, "framebuffer", &fb, &phandle);
> + *     fdtdec_add_reserved_memory(fdt, "framebuffer", &fb, &phandle, false);
>   *
>   * This results in the following subnode being added to the top-level
>   * /reserved-memory node:
> @@ -1043,11 +1043,12 @@ static inline int fdtdec_set_phandle(void *blob, int node, uint32_t phandle)
>   * @param carveout	information about the carveout region
>   * @param phandlep	return location for the phandle of the carveout region
>   *			can be NULL if no phandle should be added
> + * @param no_map	add "no-map" property if true
>   * @return 0 on success or a negative error code on failure
>   */
>  int fdtdec_add_reserved_memory(void *blob, const char *basename,
>  			       const struct fdt_memory *carveout,
> -			       uint32_t *phandlep);
> +			       uint32_t *phandlep, bool no_map);
>  
>  /**
>   * fdtdec_get_carveout() - reads a carveout from an FDT
> diff --git a/lib/fdtdec.c b/lib/fdtdec.c
> index 30a1c6a217..bf40d87cb3 100644
> --- a/lib/fdtdec.c
> +++ b/lib/fdtdec.c
> @@ -1303,7 +1303,7 @@ static int fdtdec_init_reserved_memory(void *blob)
>  
>  int fdtdec_add_reserved_memory(void *blob, const char *basename,
>  			       const struct fdt_memory *carveout,
> -			       uint32_t *phandlep)
> +			       uint32_t *phandlep, bool no_map)
>  {
>  	fdt32_t cells[4] = {}, *ptr = cells;
>  	uint32_t upper, lower, phandle;
> @@ -1403,6 +1403,12 @@ int fdtdec_add_reserved_memory(void *blob, const char *basename,
>  	if (err < 0)
>  		return err;
>  
> +	if (no_map) {
> +		err = fdt_setprop(blob, node, "no-map", NULL, 0);
> +		if (err < 0)
> +			return err;
> +	}
> +
>  	/* return the phandle for the new node for the caller to use */
>  	if (phandlep)
>  		*phandlep = phandle;
> @@ -1468,7 +1474,7 @@ int fdtdec_set_carveout(void *blob, const char *node, const char *prop_name,
>  	fdt32_t value;
>  	void *prop;
>  
> -	err = fdtdec_add_reserved_memory(blob, name, carveout, &phandle);
> +	err = fdtdec_add_reserved_memory(blob, name, carveout, &phandle, false);
>  	if (err < 0) {
>  		debug("failed to add reserved memory: %d\n", err);
>  		return err;
> diff --git a/lib/optee/optee.c b/lib/optee/optee.c
> index 457d4cca8a..963c2ff430 100644
> --- a/lib/optee/optee.c
> +++ b/lib/optee/optee.c
> @@ -192,7 +192,7 @@ int optee_copy_fdt_nodes(const void *old_blob, void *new_blob)
>  				ret = fdtdec_add_reserved_memory(new_blob,
>  								 nodename,
>  								 &carveout,
> -								 NULL);
> +								 NULL, false);
>  				free(oldname);
>  
>  				if (ret < 0)
> diff --git a/test/dm/fdtdec.c b/test/dm/fdtdec.c
> index 716993f706..4119003041 100644
> --- a/test/dm/fdtdec.c
> +++ b/test/dm/fdtdec.c
> @@ -80,7 +80,7 @@ static int dm_test_fdtdec_add_reserved_memory(struct unit_test_state *uts)
>  	resv.start = 0x1000;
>  	resv.end = 0x1fff;
>  	ut_assertok(fdtdec_add_reserved_memory(blob, "rsvd_region",
> -					       &resv, &phandle));
> +					       &resv, &phandle, false));
>  
>  	/* Test /reserve-memory and its subnode should exist */
>  	parent = fdt_path_offset(blob, "/reserved-memory");
> @@ -101,7 +101,7 @@ static int dm_test_fdtdec_add_reserved_memory(struct unit_test_state *uts)
>  	resv.start = 0x2000;
>  	resv.end = 0x2fff;
>  	ut_assertok(fdtdec_add_reserved_memory(blob, "rsvd_region1",
> -					       &resv, &phandle1));
> +					       &resv, &phandle1, false));
>  	subnode = fdt_path_offset(blob, "/reserved-memory/rsvd_region1");
>  	ut_assert(subnode > 0);
>  
> @@ -115,7 +115,7 @@ static int dm_test_fdtdec_add_reserved_memory(struct unit_test_state *uts)
>  	resv.start = 0x1000;
>  	resv.end = 0x1fff;
>  	ut_assertok(fdtdec_add_reserved_memory(blob, "rsvd_region2",
> -					       &resv, &phandle1));
> +					       &resv, &phandle1, false));
>  	subnode = fdt_path_offset(blob, "/reserved-memory/rsvd_region2");
>  	ut_assert(subnode < 0);
>  
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF6D8996A2
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Apr 2024 09:36:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6568C6C83C;
	Fri,  5 Apr 2024 07:36:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E940C6B47E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 07:36:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4353bZp8028951; Fri, 5 Apr 2024 09:36:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=yzL9ksV/ItUtRQRrv8N9RNuHb8DoH5nwHlFFCag8dTc=; b=mq
 m1tnYa5fE7NPryPF6rti+OFqTa/YRl2EkENQBZds5VyvhbcJkPU/dvUXakj4utys
 AQgtp2z5Fa6ERp3GksnZNifJfR4nkToD5yu56Qv9YGkfeVUWRcGjsUaGA24RqgJN
 kiOpZk/htDl5d5PYg8E/CB0Vozm2IeKnlaksKWxXhVIf61nv4euGDXPPjzGbfgQJ
 NLdybDEBGRHDp5iKBEHvl16pDWU7CCAQgIyRBaWR3lNMvEXW/GrXTGwbJSuO4EXx
 yiTOVKAAseBigVO2SDur5u43kEH0Uc6dp3G/Ucr/K9UqLBAs/78UfuYASlcwIRHy
 Jg1IFVzm0gNAcRrATQqw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x9empp1uf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 09:36:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8EA704002D;
 Fri,  5 Apr 2024 09:36:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB9D020F2AD;
 Fri,  5 Apr 2024 09:35:40 +0200 (CEST)
Received: from [10.252.29.225] (10.252.29.225) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Apr
 2024 09:35:40 +0200
Message-ID: <3e214800-4b78-4bbf-b559-633326bf2f1a@foss.st.com>
Date: Fri, 5 Apr 2024 09:35:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240312211628.32842-1-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240312211628.32842-1-marex@denx.de>
X-Originating-IP: [10.252.29.225]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_06,2024-04-04_01,2023-05-22_02
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com,
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] ARM: imx: stm32: Test whether ethernet
 node is enabled before reading MAC EEPROM on DHSOM
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



On 3/12/24 22:15, Marek Vasut wrote:
> Check whether the ethernet interface is enabled at all before reading
> MAC EEPROM. As a cost saving measure, it can happen that the MAC EEPROM
> is not populated on SoMs which do not use ethernet.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>
> Cc: Andreas Geisreiter <ageisreiter@dh-electronics.de>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Stefano Babic <sbabic@denx.de>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
> NOTE: It is probably best if this goes in via either imx or stm32 tree,
>       I can break the patch up, but that would introduce dependency
>       between two PRs in different trees. Let me know what you prefer.
> ---
>  board/dhelectronics/common/dh_common.c           | 16 ++++++++++++++++
>  board/dhelectronics/common/dh_common.h           |  8 ++++++++
>  board/dhelectronics/dh_imx6/dh_imx6.c            |  3 +++
>  .../dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c  |  6 ++++++
>  board/dhelectronics/dh_stm32mp1/board.c          |  6 ++++++
>  5 files changed, 39 insertions(+)
> 
> diff --git a/board/dhelectronics/common/dh_common.c b/board/dhelectronics/common/dh_common.c
> index 67e3d59b1f3..34094a020b0 100644
> --- a/board/dhelectronics/common/dh_common.c
> +++ b/board/dhelectronics/common/dh_common.c
> @@ -18,6 +18,19 @@ bool dh_mac_is_in_env(const char *env)
>  	return eth_env_get_enetaddr(env, enetaddr);
>  }
>  
> +int dh_get_mac_is_enabled(const char *alias)
> +{
> +	ofnode node = ofnode_path(alias);
> +
> +	if (!ofnode_valid(node))
> +		return -EINVAL;
> +
> +	if (!ofnode_is_enabled(node))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
>  int dh_get_mac_from_eeprom(unsigned char *enetaddr, const char *alias)
>  {
>  	struct udevice *dev;
> @@ -57,6 +70,9 @@ __weak int dh_setup_mac_address(void)
>  	if (dh_mac_is_in_env("ethaddr"))
>  		return 0;
>  
> +	if (dh_get_mac_is_enabled("ethernet0"))
> +		return 0;
> +
>  	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0"))
>  		return eth_env_set_enetaddr("ethaddr", enetaddr);
>  
> diff --git a/board/dhelectronics/common/dh_common.h b/board/dhelectronics/common/dh_common.h
> index 2b24637d96d..a2de5b1553e 100644
> --- a/board/dhelectronics/common/dh_common.h
> +++ b/board/dhelectronics/common/dh_common.h
> @@ -11,6 +11,14 @@
>   */
>  bool dh_mac_is_in_env(const char *env);
>  
> +/*
> + * dh_get_mac_is_enabled - Test if ethernet MAC is enabled in DT
> + *
> + * @alias: alias for ethernet MAC device tree node
> + * Return: 0 if OK, other value on error
> + */
> +int dh_get_mac_is_enabled(const char *alias);
> +
>  /*
>   * dh_get_mac_from_eeprom - Get MAC address from eeprom and write it to enetaddr
>   *
> diff --git a/board/dhelectronics/dh_imx6/dh_imx6.c b/board/dhelectronics/dh_imx6/dh_imx6.c
> index 07fc9b1fe6d..0676587c38a 100644
> --- a/board/dhelectronics/dh_imx6/dh_imx6.c
> +++ b/board/dhelectronics/dh_imx6/dh_imx6.c
> @@ -92,6 +92,9 @@ int dh_setup_mac_address(void)
>  	if (dh_mac_is_in_env("ethaddr"))
>  		return 0;
>  
> +	if (dh_get_mac_is_enabled("ethernet0"))
> +		return 0;
> +
>  	if (!dh_imx_get_mac_from_fuse(enetaddr))
>  		goto out;
>  
> diff --git a/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c b/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
> index 5f12d787d38..ff2c0e87215 100644
> --- a/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
> +++ b/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
> @@ -47,6 +47,9 @@ static int dh_imx8_setup_ethaddr(void)
>  	if (dh_mac_is_in_env("ethaddr"))
>  		return 0;
>  
> +	if (dh_get_mac_is_enabled("ethernet0"))
> +		return 0;
> +
>  	if (!dh_imx_get_mac_from_fuse(enetaddr))
>  		goto out;
>  
> @@ -66,6 +69,9 @@ static int dh_imx8_setup_eth1addr(void)
>  	if (dh_mac_is_in_env("eth1addr"))
>  		return 0;
>  
> +	if (dh_get_mac_is_enabled("ethernet1"))
> +		return 0;
> +
>  	if (!dh_imx_get_mac_from_fuse(enetaddr))
>  		goto increment_out;
>  
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index 88eb7d1b8d4..b3309c9d330 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -129,6 +129,9 @@ static int dh_stm32_setup_ethaddr(void)
>  	if (dh_mac_is_in_env("ethaddr"))
>  		return 0;
>  
> +	if (dh_get_mac_is_enabled("ethernet0"))
> +		return 0;
> +
>  	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0"))
>  		return eth_env_set_enetaddr("ethaddr", enetaddr);
>  
> @@ -142,6 +145,9 @@ static int dh_stm32_setup_eth1addr(void)
>  	if (dh_mac_is_in_env("eth1addr"))
>  		return 0;
>  
> +	if (dh_get_mac_is_enabled("ethernet1"))
> +		return 0;
> +
>  	if (dh_stm32_mac_is_in_ks8851())
>  		return 0;
>  
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

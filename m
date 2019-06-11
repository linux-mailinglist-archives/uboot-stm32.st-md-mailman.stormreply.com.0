Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B67C43C52B
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Jun 2019 09:34:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84BC2CB40BE
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Jun 2019 07:34:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3B97CB40BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 07:34:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5B7UsWK028415; Tue, 11 Jun 2019 09:34:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=+riWYEMDkdMQwVJGOXIIPHml65cp5m3Mm+H5ODFwo7M=;
 b=ZPbTxV03ZkVqyLPO+aYHWG9n8emnJ9u9UmIXnjRP+FJQaXud6Suj4IPk52Zw18I2DcD7
 rFW+JxqliejkTUD8MwDHjSM9iAFWUOGo+cqY+pb2HAn/8AJ11m4/mxttVlYFD5yEt39z
 UmGEHI7deG0QRew9Yp/IhBoc+EnRuoifXzwRDsVF8niJU+tL3pWcRMDuGffcEoH2srZf
 Yzoh/unlzxBtelA1F9WJb4OEAzluC8f/jDHhdP1bBOQr+MQWe0N4xhWpehvX6HEqE2oo
 Dx5PK8u4nm6ajGlqisVHHDBAVbCvi36TInzYEaGxeGh1sExnt1ZsCXws/o/R1pcdiTp8 Ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t26rm8dxr-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 11 Jun 2019 09:34:56 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B817931;
 Tue, 11 Jun 2019 07:34:55 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A29BB13AE;
 Tue, 11 Jun 2019 07:34:55 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 11 Jun
 2019 09:34:55 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 11 Jun 2019 09:34:55 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Christophe ROULLIER <christophe.roullier@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 2/6] board: stm32mp1: Add board_interface_eth_init
Thread-Index: AQHVDLGtrF2X3RKSm0+aLfBR6KtEC6aWFWmA
Date: Tue, 11 Jun 2019 07:34:55 +0000
Message-ID: <044d9cdf-718a-ebfc-5ec4-2f609dfeda2f@st.com>
References: <20190517130847.13144-1-christophe.roullier@st.com>
 <20190517130847.13144-3-christophe.roullier@st.com>
In-Reply-To: <20190517130847.13144-3-christophe.roullier@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <01AACC2F194B314EA02024F7549E4A8A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-11_03:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/6] board: stm32mp1: Add
	board_interface_eth_init
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



On 5/17/19 3:08 PM, Christophe Roullier wrote:
> Called to configure Ethernet PHY interface selection and
> configure clock selection in RCC Ethernet clock tree.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
> 
> Changes in v2: None
> 
>  board/st/stm32mp1/stm32mp1.c | 68 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 3 deletions(-)
> 
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 76917b022ed..e120fc57223 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -51,9 +51,9 @@
>  #define SYSCFG_PMCSETR_ETH_SELMII	BIT(20)
>  
>  #define SYSCFG_PMCSETR_ETH_SEL_MASK	GENMASK(23, 21)
> -#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII	(0 << 21)
> -#define SYSCFG_PMCSETR_ETH_SEL_RGMII	(1 << 21)
> -#define SYSCFG_PMCSETR_ETH_SEL_RMII	(4 << 21)
> +#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII	0
> +#define SYSCFG_PMCSETR_ETH_SEL_RGMII	BIT(21)
> +#define SYSCFG_PMCSETR_ETH_SEL_RMII	BIT(23)
>  
>  /*
>   * Get a global data pointer
> @@ -504,3 +504,65 @@ void board_quiesce_devices(void)
>  {
>  	setup_led(LEDST_OFF);
>  }
> +
> +/* board interface eth init */
> +/* this is a weak define that we are overriding */
> +int board_interface_eth_init(phy_interface_t interface_type,
> +			     bool eth_clk_sel_reg, bool eth_ref_clk_sel_reg)
> +{
> +	u8 *syscfg;
> +	u32 value;
> +
> +	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
> +
> +	if (!syscfg)
> +		return -ENODEV;
> +
> +	switch (interface_type) {
> +	case PHY_INTERFACE_MODE_MII:
> +		value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
> +			SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
> +		debug("%s: PHY_INTERFACE_MODE_MII\n", __func__);
> +		break;
> +	case PHY_INTERFACE_MODE_GMII:
> +		if (eth_clk_sel_reg)
> +			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
> +				SYSCFG_PMCSETR_ETH_CLK_SEL;
> +		else
> +			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII;
> +		debug("%s: PHY_INTERFACE_MODE_GMII\n", __func__);
> +		break;
> +	case PHY_INTERFACE_MODE_RMII:
> +		if (eth_ref_clk_sel_reg)
> +			value = SYSCFG_PMCSETR_ETH_SEL_RMII |
> +				SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
> +		else
> +			value = SYSCFG_PMCSETR_ETH_SEL_RMII;
> +		debug("%s: PHY_INTERFACE_MODE_RMII\n", __func__);
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		if (eth_clk_sel_reg)
> +			value = SYSCFG_PMCSETR_ETH_SEL_RGMII |
> +				SYSCFG_PMCSETR_ETH_CLK_SEL;
> +		else
> +			value = SYSCFG_PMCSETR_ETH_SEL_RGMII;
> +		debug("%s: PHY_INTERFACE_MODE_RGMII\n", __func__);
> +		break;
> +	default:
> +		debug("%s: Do not manage %d interface\n",
> +		      __func__, interface_type);
> +		/* Do not manage others interfaces */
> +		return -EINVAL;
> +	}
> +
> +	/* clear and set ETH configuration bits */
> +	writel(SYSCFG_PMCSETR_ETH_SEL_MASK | SYSCFG_PMCSETR_ETH_SELMII |
> +	       SYSCFG_PMCSETR_ETH_REF_CLK_SEL | SYSCFG_PMCSETR_ETH_CLK_SEL,
> +	       syscfg + SYSCFG_PMCCLRR);
> +	writel(value, syscfg + SYSCFG_PMCSETR);
> +
> +	return 0;
> +}
> 


Applied

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

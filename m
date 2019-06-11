Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC4A3C529
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Jun 2019 09:34:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27264CB40B9
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Jun 2019 07:34:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0E46CB40AB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 07:34:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5B7VPwq018851; Tue, 11 Jun 2019 09:34:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=xrPR5f4KuKPkySkOwEgWMG22vHovLqPzs0m61VLrTD4=;
 b=VPYp++b7t8Y0///Gv9mwGsv67jJDfl6NerxB6qJOcvSERisTHecc1ZeuSnhtii1qqQ/q
 k+K9S0UXr7XR8b/RgKnhimf6qqtZNt0M0tr0HNA/KvJpq5poXgIQdCIa11znemx0THUt
 HcfT/S+fdmGR9epfmz9X7spbPkwtGZVEiUoSR66ztLh1WCF1Gf7G6BVg4cEjIFR/zrUT
 GQrSuwqlhfe4Ev4bWPBQuY8kDjKqT7amfXj4ShFHiU4CAxDmA88DBjwfKGPx8uWCgbYW
 KWbiJugISxz25hPzF7va9dZ/vT43SM3aLSaVSeLm0KnhAG8wQnqBmISd9dOWdNhTaGzU ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t26rp8dmt-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 11 Jun 2019 09:34:42 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61C9B34;
 Tue, 11 Jun 2019 07:34:42 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C43A13AE;
 Tue, 11 Jun 2019 07:34:42 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 11 Jun
 2019 09:34:41 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 11 Jun 2019 09:34:41 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Christophe ROULLIER <christophe.roullier@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 1/6] stm32mp1: clk: use the correct identifier for
 ethck
Thread-Index: AQHVDLGsrFrLCrbMQk+GhaTbF5l60aaWFVkA
Date: Tue, 11 Jun 2019 07:34:41 +0000
Message-ID: <6ababc4c-e1ed-05a8-dcfb-00fc53d3eea6@st.com>
References: <20190517130847.13144-1-christophe.roullier@st.com>
 <20190517130847.13144-2-christophe.roullier@st.com>
In-Reply-To: <20190517130847.13144-2-christophe.roullier@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <8E315EE1D0539B408D2E421E05BB8886@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-11_03:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/6] stm32mp1: clk: use the correct
 identifier for ethck
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
> From: Patrick Delaunay <patrick.delaunay@st.com>
> 
> ETHCK_K is the identifier the kernel clock for ETH in kernel
> binding, selected by ETHKSELR / gated by ETHCKEN = BIT(7).
> U-Boot driver need to use the same identifier, so change ETHCK
> to ETHCK_K.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
> 
> Changes in v2: None
> 
>  drivers/clk/clk_stm32mp1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
> index 24859fd054e..422176f3dde 100644
> --- a/drivers/clk/clk_stm32mp1.c
> +++ b/drivers/clk/clk_stm32mp1.c
> @@ -555,7 +555,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
>  
>  	STM32MP1_CLK_SET_CLR(RCC_MP_AHB5ENSETR, 0, GPIOZ, _UNKNOWN_SEL),
>  
> -	STM32MP1_CLK_SET_CLR(RCC_MP_AHB6ENSETR, 7, ETHCK, _ETH_SEL),
> +	STM32MP1_CLK_SET_CLR(RCC_MP_AHB6ENSETR, 7, ETHCK_K, _ETH_SEL),
>  	STM32MP1_CLK_SET_CLR(RCC_MP_AHB6ENSETR, 8, ETHTX, _UNKNOWN_SEL),
>  	STM32MP1_CLK_SET_CLR(RCC_MP_AHB6ENSETR, 9, ETHRX, _UNKNOWN_SEL),
>  	STM32MP1_CLK_SET_CLR_F(RCC_MP_AHB6ENSETR, 10, ETHMAC, _ACLK),
> 


Applied

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

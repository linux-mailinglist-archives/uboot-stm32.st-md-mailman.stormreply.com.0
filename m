Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFF15FACC7
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Oct 2022 08:27:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F549C6411C;
	Tue, 11 Oct 2022 06:27:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E6C8C63327
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 06:27:30 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B2xLrM018181;
 Tue, 11 Oct 2022 08:27:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=s08eNXJl6kw/sd+i0R/0I8ICL73iSAptKmF33v/2u+U=;
 b=USin/7XR2BuZSrfHIbMZB+53eZr4lV1xB33UXQEWjHucj/TbJTXByIlJdMuyVoMH3+V3
 s1NmlQi40FV5iqvFrWs5fKrit019jKiuaOiToqj9hJUpXyxFtxBLJVMEBWepc5ENPLpL
 XlEm2SiE68aaY0zqJTRpqNYgj0t74js/TjUhr7GrhwA2uMF8o0JjGX0IM9Qy9jvLFzty
 2mV9aNxAq1RfiOwCsuXwfuaozEsVplKx9NigPwz6eU8xHAyZB0O4VRd445BZB993uTXV
 L0ecXrYZI4vjrrr+mh5xSRuqa1BYtfqkuhqKJ4d1geQ1mLJJETmm6zDnvvpitNaAjrWi eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k31m9fk9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Oct 2022 08:27:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 472E310002A;
 Tue, 11 Oct 2022 08:27:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3ED682105B7;
 Tue, 11 Oct 2022 08:27:23 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 11 Oct
 2022 08:27:22 +0200
Message-ID: <e53f5861-bdd4-d130-b457-976b648b2d2e@foss.st.com>
Date: Tue, 11 Oct 2022 08:27:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221010105612.1.Iba72bf97918ac926814c68f50c2246f4744f2ab9@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221010105612.1.Iba72bf97918ac926814c68f50c2246f4744f2ab9@changeid>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-11_03,2022-10-10_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: update SCMI dedicated
	file
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



On 10/10/22 10:56, Patrick Delaunay wrote:
> The PWR regulators don't need be removed as they are already deactivated.
> This patches is a alignment with the accepted patch in Linux device tree
> in commit a34b42f8690c ("ARM: dts: stm32: fix pwr regulators references
> to use scmi").
> 
> Fixes: 69ef98b209e7 ("ARM: dts: stm32mp15: alignment with v5.19")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp15-scmi.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp15-scmi.dtsi b/arch/arm/dts/stm32mp15-scmi.dtsi
> index 37d4547b3e8..543f24c2f4f 100644
> --- a/arch/arm/dts/stm32mp15-scmi.dtsi
> +++ b/arch/arm/dts/stm32mp15-scmi.dtsi
> @@ -103,7 +103,3 @@
>  /delete-node/ &clk_lse;
>  /delete-node/ &clk_lsi;
>  /delete-node/ &clk_csi;
> -/delete-node/ &reg11;
> -/delete-node/ &reg18;
> -/delete-node/ &usb33;
> -/delete-node/ &pwr_regulators;

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

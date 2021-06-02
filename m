Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC92F3982DA
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Jun 2021 09:19:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D52F0C57B6F;
	Wed,  2 Jun 2021 07:19:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC1B1C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 07:19:39 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15277Ehm010756; Wed, 2 Jun 2021 09:19:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=NsClIo1ZsqEksktGJ373RPb8DrHWxxgDM/DXgsZmWSU=;
 b=wbzqPVpa/RcAY5bjxlbemto1N1Leu84exg2gE0S9OY5w6Cy3P0V/npLQA1eFWZLD83iB
 Wy8f/we7ztUqGijg5OMFByfog5FhJ6Dd+cSwfdzirXB3T3Fl/uKR4UDfob9nre1UdNxN
 Se9BybhVlP+E73MdtmC1nAKoEomp8jYtlptmm3Hga5szWS25FDnZC7Fi0Q3KLZMKI1sO
 IN0y0kg1ReQZ6TYm6qYilsVPetZ3FB2tBXfXizIM7a4od2W2x7KaahnaplxSB/g4Dga3
 +ejfrCqN7pP+i61XRE6dXKjKHGcsLLHR8KVX3OJwego0JqKXrlGwR9xPJ8uMgMBo7T4J Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38x3guseca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 09:19:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3E1E810008B;
 Wed,  2 Jun 2021 09:19:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30C622128BD;
 Wed,  2 Jun 2021 09:19:33 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 2 Jun
 2021 09:19:32 +0200
To: <u-boot@lists.denx.de>, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <cover.1622220270.git.gszymaszek@short.pl>
 <a54b962e38b1e66712e17c0f725d84ba18bcfa8c.1622220270.git.gszymaszek@short.pl>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <ad511e35-9abc-6de0-bcb1-a7d5ca868079@foss.st.com>
Date: Wed, 2 Jun 2021 09:19:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a54b962e38b1e66712e17c0f725d84ba18bcfa8c.1622220270.git.gszymaszek@short.pl>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_02:2021-06-01,
 2021-06-02 signatures=0
Subject: Re: [Uboot-stm32] [PATCH 4/5] arm: dts: stm32mp157c-odyssey-som:
 enable the SDMMC2 eMMC HS DDR mode
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

Your commit message is missing

On 5/28/21 6:54 PM, Grzegorz Szymaszek wrote:
> Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>  arch/arm/dts/stm32mp157c-odyssey-som.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/dts/stm32mp157c-odyssey-som.dtsi b/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
> index 76a364d4ca..0dfdc29db6 100644
> --- a/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
> +++ b/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
> @@ -270,6 +270,7 @@
>  	bus-width = <8>;
>  	vmmc-supply = <&v3v3>;
>  	vqmmc-supply = <&vdd>;
> +	mmc-ddr-3_3v;
>  	status = "okay";
>  };
>  
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

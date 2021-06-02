Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E69463982DE
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Jun 2021 09:20:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEA21C57B75;
	Wed,  2 Jun 2021 07:20:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B12DC57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 07:20:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152787IX018898; Wed, 2 Jun 2021 09:20:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=lKasK/hH2rbfWx1bKrtiBnp6SHVRFkK5oZc8e0JExQw=;
 b=LExbLpPFTQtDSrfxgi/j6vHeaCPgRavMsKpAIZ6QjL2z/kDlOuDlDz54V9FhejqfQYoh
 457dXy7HqT+eNJeoXGmYaZ5qEDBNNdzvAx1sZ+Tu6djBEVzJbzjI/cQcrXCNx6+x2Nth
 4nL6jNxYvzbp1D7TJCGw+3n3dBKivV8ekN5zMuewlTztatO1Imvg70ltYv1awBVl8Ozr
 ILn03Ir/sxKcfhOwtkGGUmDGYkBtbjYwGfogAmVm3ch0O094ModbtTi409f6AMRxFVsH
 4hQ3WkmoK0XnrrBzSWixFn5ypyZu+DYcMShpSL4GCLdvi1BsoN+H5BMT1Og+SxQgqDo4 ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38x3gvhg89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 09:20:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FFCE100121;
 Wed,  2 Jun 2021 09:20:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 73EDF2128C4;
 Wed,  2 Jun 2021 09:20:32 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 2 Jun
 2021 09:20:31 +0200
To: <u-boot@lists.denx.de>, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <cover.1622220270.git.gszymaszek@short.pl>
 <33414ca650e577be89ca22ac370aa59019e59273.1622220270.git.gszymaszek@short.pl>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <246f7425-4468-bee0-4eb7-b32a94131618@foss.st.com>
Date: Wed, 2 Jun 2021 09:20:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <33414ca650e577be89ca22ac370aa59019e59273.1622220270.git.gszymaszek@short.pl>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_02:2021-06-01,
 2021-06-02 signatures=0
Subject: Re: [Uboot-stm32] [PATCH 5/5] arm: dts: stm32mp157c-odyssey-som:
 enable SDMMC2 in SPL
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
>  .../dts/stm32mp157c-odyssey-som-u-boot.dtsi   | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp157c-odyssey-som-u-boot.dtsi b/arch/arm/dts/stm32mp157c-odyssey-som-u-boot.dtsi
> index 6be728846e..4ff848350d 100644
> --- a/arch/arm/dts/stm32mp157c-odyssey-som-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-odyssey-som-u-boot.dtsi
> @@ -123,3 +123,24 @@
>  		u-boot,dm-pre-reloc;
>  	};
>  };
> +
> +&sdmmc2 {
> +	u-boot,dm-spl;
> +};
> +
> +&sdmmc2_b4_pins_a {
> +	u-boot,dm-spl;
> +	pins1 {
> +		u-boot,dm-spl;
> +	};
> +	pins2 {
> +		u-boot,dm-spl;
> +	};
> +};
> +
> +&sdmmc2_d47_pins_d {
> +	u-boot,dm-spl;
> +	pins {
> +		u-boot,dm-spl;
> +	};
> +};
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

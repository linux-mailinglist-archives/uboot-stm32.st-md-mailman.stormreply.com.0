Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CADB399BAF
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Jun 2021 09:36:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E78E8C57B55;
	Thu,  3 Jun 2021 07:36:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73FC4C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jun 2021 07:36:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1537QZd4001915; Thu, 3 Jun 2021 09:36:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MzrDJo9Pl9XpMnYEKAa0spoJRsJHylbmOi7K6U9WfHI=;
 b=XzDcCag2jExOQi7rO4aP5pOSqmyNGpzoerWCOyBRh5bTVkhNbU21apgcYyx3YMXIvMtH
 8kiVvil/ZLnJmfE4hKf/jzzEgqas48ipnN0OenRFsEGLj7Ble4wBYFLTDPUkiFwQplLk
 UsznNsr7VEA4lSVGvjjkVK/9vaHXdFo2QLnT3CD5wea/DA9onh3DVSvc+MJSw7y96gR1
 TXwtuoPatotA9s2n9slrN1Q3Mb3QRpfwTd2BjRKf+1nSGItGVTWah2SrYnd0hnG03pow
 ih9VVfVkedTluOahwB0G2ZmYJOGo9WW5dSZQle/2JFLh2YxWBEkHsaB1nW0KIw30spjv eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38xt0yrbpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jun 2021 09:36:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C49510002A;
 Thu,  3 Jun 2021 09:36:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 722E4211F3D;
 Thu,  3 Jun 2021 09:36:22 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 3 Jun
 2021 09:36:22 +0200
To: <u-boot@lists.denx.de>, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <cover.1622651232.git.gszymaszek@short.pl>
 <ed12b825edd22f1a04a842857e24ca7b7a4fe5ed.1622651232.git.gszymaszek@short.pl>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <0819eb06-c291-a63c-19a7-f947e0dd0782@foss.st.com>
Date: Thu, 3 Jun 2021 09:36:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ed12b825edd22f1a04a842857e24ca7b7a4fe5ed.1622651232.git.gszymaszek@short.pl>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-03_04:2021-06-02,
 2021-06-03 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v2 5/5] arm: dts: stm32mp157c-odyssey-som:
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

Hi Grzegorz

On 6/2/21 7:09 PM, Grzegorz Szymaszek wrote:
> Enable the SDMMC2 device tree node, as well as the pins it uses, in
> U-Boot SPL.
> 
> Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> Changes for v2:
>    - rebased on current master
>    - added a short commit message body
> 
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
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

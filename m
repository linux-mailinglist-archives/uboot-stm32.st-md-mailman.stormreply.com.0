Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2B53FCC4A
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Aug 2021 19:27:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 040B3C57B7A;
	Tue, 31 Aug 2021 17:27:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48DDEC57B60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Aug 2021 17:27:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17VAoBwI001982;
 Tue, 31 Aug 2021 19:27:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5QzNBt4mpJeLc6odZnXWuX6dag2S4XSnRfuuhTMRRNk=;
 b=OWzUr6bwjmNtmkGLwYKkIp5+472cAsAxj7k/TDf5PffZw76Uca6ECtWdBv7hCgM4Bj+a
 Xf67jQ5OQ3/jnaGlKpNbp8Ln4jPyHvOPw7K6C6Xo/xUeL4Y/EWdIxK/KxIcT3VR7CP+r
 whxNZEY0LG4P2/OyAV7xIc0BOyTXVeeVY8GvKjvSAGg20rjuw5rj9JuFByfQRxB2HR0u
 FAwond7jHdIlJua/NBKCdHuzZTB1w5qPsQuRMIUIy7wQaiwCP7hEUfv0IkhoeEe3D+Cd
 8AFDTpkse4um6zMAUlZ7tdt11haSZAg76Ob43gUQjxREB/hFtRtqWFCeRRj6M1PzwrUk Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3asdqsv6t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 19:27:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA00E10002A;
 Tue, 31 Aug 2021 19:27:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C0D1622807F;
 Tue, 31 Aug 2021 19:27:16 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Aug
 2021 19:27:16 +0200
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, <u-boot@lists.denx.de>
References: <20210826214209.254461-1-mr.nuke.me@gmail.com>
 <20210826214209.254461-10-mr.nuke.me@gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <525d8f3c-9961-0102-854b-553bf8906137@foss.st.com>
Date: Tue, 31 Aug 2021 19:27:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826214209.254461-10-mr.nuke.me@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-31_08,2021-08-31_01,2020-04-07_01
Cc: marex@denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 09/10] ARM: dts: stm32mp: Add OP-TEE
 "/firmware" node to SPL dtb
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 8/26/21 11:42 PM, Alexandru Gagniuc wrote:
> This node is required in SPL when booting an OP-TEE payload. Add it to
> the SPL devicetree.
>
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>   arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> index 0101962ea5..2e65b9b4d5 100644
> --- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> @@ -31,6 +31,7 @@
>   		optee {
>   			compatible = "linaro,optee-tz";
>   			method = "smc";
> +			u-boot,dm-spl;
>   		};
>   	};
>   


NAK = the OP-TEE nodes are ADDED by the OP-TEE firmware

when SPL is running the OP-TEE firmware is not running and the OP-TEE 
driver is not probed

=> this nodes are not required

This node should be present ONLY for backyard compatibility (STM32IMAGE 
support in U-Boot trusted boot)


regards


Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

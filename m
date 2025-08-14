Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C357B26AD9
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Aug 2025 17:26:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEEAAC32EB5;
	Thu, 14 Aug 2025 15:26:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0D1FC32EB0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 15:26:45 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EExbG1015908;
 Thu, 14 Aug 2025 17:24:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 BcprotUE5u6W/zcJLT34auIs5YpNm7h4Ffut8wYyNgE=; b=boeXjzE3G5btQAtf
 zzjuCvrtmKhVqZyTTnYd9KRi5pc8AtFWkbQSy23cA6nIRqh+DoPEZPgF+wP4tWqs
 FMprhscN8CjWvGQtwdG/+VJmfdLV0fJAQoBplBSxDKpDGDaGfRqV/Vgckhw1fDal
 FiAXSTlrGqKsE9IPBiEGdU5a7uFi3vU9xNqZn9PYBFlpl6LcGFv7h64nrWcP1GoJ
 LTVvkm0Qs/QRR7MrRU9JBvMYh1PlBFRzcjJIlsyHb9slhHSH/vDLD7ItPtPlqiPA
 32HI5L4Vr4Lt36kiOU3EXOyxAuouIYBgaCPAALs+HCfwwGNECNd1CMo2ffRIMXLp
 e+YXww==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48efw525wu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Aug 2025 17:24:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A314340044;
 Thu, 14 Aug 2025 17:23:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 50C667370B4;
 Thu, 14 Aug 2025 17:23:06 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 17:23:05 +0200
Message-ID: <626aac73-10f5-4514-a6ea-0b67a7b2d45b@foss.st.com>
Date: Thu, 14 Aug 2025 17:23:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250814120938.1358059-1-patrice.chotard@foss.st.com>
 <a10f97cf-72d8-4f82-870f-cb845e5cb72e@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <a10f97cf-72d8-4f82-870f-cb845e5cb72e@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] configs: stm32mp25: Enable
	OF_UPSTREAM_BUILD_VENDOR
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



On 8/14/25 15:37, Marek Vasut wrote:
> On 8/14/25 2:09 PM, Patrice Chotard wrote:
>> Initially, only one STM32MP25 based board was available, the
>> stm32mp257f-ev1 board which was set by default in stm32mp25_defconfig.
>>
>> Since commit 79f3e77133bd ("Subtree merge tag 'v6.16-dts' of dts repo [1] into dts/upstream")
>> we inherited of a second MP25 based board which is the stm32mp257f-dk board.
>>
>> Enable OF_UPSTREAM_BUILD_VENDOR and set OF_UPSTREAM_VENDOR to allow all
>> STMicroelectronics DT compilation.
> If I build stm32mp25_defconfig , I can run the result on both EV1 and DK now ?
> 

With this patch yes

> It seems only the EV1 DT is built into the binary, so why compile all DTs ?

By default yes, only EV1 DT is built. that's why OF_UPSTREAM_BUILD_VENDOR is needed to 
allow all other st/*.dtb to be built.

> 
> $ grep TREE configs/stm32mp25_defconfig
> CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp257f-ev1"
> 

Currently if you try to build U-Boot for stm32mp257f-dk board using the following commands:

make stm32mp25_defconfig
make DEVICE_TREE=st/stm32mp257f-dk

You ended up with the following error:

....
  CC      lib/rtc-lib.o
  AR      lib/built-in.a
  AR      examples/built-in.a
  LD      u-boot
  OBJCOPY u-boot.srec
  OBJCOPY u-boot-nodtb.bin
  SYM     u-boot.sym
  RELOC   u-boot-nodtb.bin
  DTC     dts/upstream/src/arm64/st/stm32mp257f-ev1.dtb

Device Tree Source (dts/upstream/src/arm64/st/stm32mp257f-dk.dtb) is not correctly specified.
Please define 'CONFIG_DEFAULT_DEVICE_TREE'
or build with 'DEVICE_TREE=<device_tree>' argument

make[1]: *** [dts/Makefile:50: dts/upstream/src/arm64/st/stm32mp257f-dk.dtb] Error 1
make: *** [Makefile:1372: dts/dt.dtb] Error 2


With this patch, the build is successful
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

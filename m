Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C7C6679B0
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 16:42:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19CD3C65E45;
	Thu, 12 Jan 2023 15:42:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1835C65048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:42:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CDDi90005697; Thu, 12 Jan 2023 16:42:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qIEMtRWtm2XLRQDOSuTJUCPVBUqjo6GHcv3UeeWWlto=;
 b=J9LUlIrf612fyA6vlK7nTcr30BupK+GAByWLU3O5se+mQMoKwrXagd/vICChdidgn9cX
 cxut8YQOP0rxNwnpyDEyGLKazD7uKmVxcbJKQdCcJZH/SVqHMOZ6vM3r1gHIL1ge0sD8
 OjJzWunPEPOHEs4IW//wA8l9IndBtExEp+IC2axrn5gbe+RZfiY7oa1l1bwsu7DMx2Yq
 Av8QTUfLfGxcGWHTDpVQ6GV80KRunt8LOVcn2L7WCg4XnXV6YQWApNetV71J38iK95S3
 SRWXjW/VQa3PtThKb0jmriPwjBc52CIz7F32LqxUhyt/Kof9YvUC4zMUGsvyQWG7bHnx oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n1tnmh0g6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 16:42:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 12049100034;
 Thu, 12 Jan 2023 16:42:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D62921B53D;
 Thu, 12 Jan 2023 16:42:51 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 12 Jan
 2023 16:42:50 +0100
Message-ID: <b490421a-ff08-36b4-ba18-9b3d9890e384@foss.st.com>
Date: Thu, 12 Jan 2023 16:42:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230106122020.1110552-1-patrick.delaunay@foss.st.com>
 <20230106131952.6.I7f8de74df18e8fba66161d68de5b6725437af691@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230106131952.6.I7f8de74df18e8fba66161d68de5b6725437af691@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Etienne CARRIERE <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 6/6] configs: stm32mp13: Activate command
	stm32key
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

Hi Patrick

On 1/6/23 13:20, Patrick Delaunay wrote:
> Activate the command stm32key with CONFIG_CMD_STM32KEY.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp13_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index f3d5e9812c6c..70b0d5dc99bf 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -7,6 +7,7 @@ CONFIG_DEFAULT_DEVICE_TREE="stm32mp135f-dk"
>  CONFIG_SYS_PROMPT="STM32MP> "
>  CONFIG_STM32MP13x=y
>  CONFIG_DDR_CACHEABLE_SIZE=0x10000000
> +CONFIG_CMD_STM32KEY=y
>  CONFIG_TARGET_ST_STM32MP13x=y
>  CONFIG_ENV_OFFSET_REDUND=0x940000
>  # CONFIG_ARMV7_NONSEC is not set
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 489DD50FBF7
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Apr 2022 13:29:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F26F6C5F1F2;
	Tue, 26 Apr 2022 11:29:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B70DC5F1D6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 11:29:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23QAEHis025819;
 Tue, 26 Apr 2022 13:29:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Q8DduAkEnO1g9GhHkkxqhgedLMaCpltcxmX/+guC+LQ=;
 b=T5xeEe1fiUN4lz5tqnCsKnuhImANJgzSlQevqNvPwhvmnbyDbrKwIU0rXrsJM/p19Dit
 sJckVhfJI2r/dfrMphqOlNBJoO/SRSSd3Zme6fXg6LVlkLuxGgHyH6eGr7JCuHHD91jC
 LoDh3qPTI9xQ2E5dJiR77iadkwH0PjSGIKBV9cbR8onZuresMFuS6AsL+jrVH/kDgCw8
 YwZSVkZAe7iXTZkfSREz1U8xBwRbCibnwLAn/gINS9XPy+sPNjYatNYZ6TekHyXWXneG
 WIVvlqohYe/uQaMdF9ioch4eSUeEQHLa7VGg0Is4gkMjUP6ta3MFvSHYZcgSp7CEPbnG Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fm8t1pjw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 13:29:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5A11F10002A;
 Tue, 26 Apr 2022 13:29:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55BB321FE81;
 Tue, 26 Apr 2022 13:29:20 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 26 Apr
 2022 13:29:19 +0200
Message-ID: <940eaf35-52a6-4a9c-dbe6-7d76c4f08a21@foss.st.com>
Date: Tue, 26 Apr 2022 13:29:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220413150500.23883-1-patrice.chotard@foss.st.com>
 <20220413150500.23883-2-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220413150500.23883-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-26_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 01/12] configs: stm32f746-disco:
 Concatenate spl and u-boot binaries
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

On 4/13/22 17:04, Patrice Chotard wrote:
> This allows to concatenate spl and u-boot binaries together.
> Previously, both binaries has to be flashed separately at the correct
> offset (spl at offset 0 and u-boot at offset 0x8000).
> With this patch, only one binary is generated (u-boot-with-spl.bin)
> and has to be copied in flash at offset 0 using openocd for example
> or simply copied in exported mass storage.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   configs/stm32f746-disco_defconfig | 1 +
>   include/configs/stm32f746-disco.h | 1 +
>   2 files changed, 2 insertions(+)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B12762F485C
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Jan 2021 11:15:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B1DAC32EA8;
	Wed, 13 Jan 2021 10:15:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A758C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 10:15:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10DACYIm000652; Wed, 13 Jan 2021 11:15:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=K9nK/xeDPz9AEaGq4Oz7PWy/DOZUM6M4nk7oWLux6+s=;
 b=NYuRXmrPdmo/tPUVpNkJZJEAzqW0Y6niYIUdv/UwNKy20SJirBDg1RanB82nvgBm6rOl
 dKH38TNlkPRfoTGnLGqDS/K985QQcazfDyHJNT+2QL1sGS7Bn6gsUYML+ZZvDjZJ1jbG
 gyS4suxtk2+Az4INaGfsrF/zs066GjkHt2+t78VwWhUmaf5W8VD9cBvT/g0StE962gMF
 5QtVDzv/kbFwg7jHvAPp8pYgfZlIUFEw1v4whyjs1FxoxvOoLWXQq5ocAeBddg51Q1wl
 zTX4o3aR4vP2ISNC76nDVf06FuxCEUVkmNRVjJWEmdqrS9SFmN5X64VRLpmuJIXSq4mN xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5kypmby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 11:15:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8706E10002A;
 Wed, 13 Jan 2021 11:15:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CDB8231DD1;
 Wed, 13 Jan 2021 11:15:32 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Jan
 2021 11:15:31 +0100
To: <u-boot@lists.denx.de>
References: <20201211153227.1.Ia09f70e65ce3bc2d845ad37b802d6096f690fc94@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <c7e81c73-6845-cde4-aea2-9a7b6889aee1@foss.st.com>
Date: Wed, 13 Jan 2021 11:15:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211153227.1.Ia09f70e65ce3bc2d845ad37b802d6096f690fc94@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_05:2021-01-13,
 2021-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp1: activate OF_LIVE for
	DT live support
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

On 12/11/20 3:32 PM, Patrick Delaunay wrote:
> Activate the live DT to reduce the DT parsing time.
>
> For example the boot time is reduced by 200ms on STM32MP157C-EV1 board
> for stm32mp15_basic_defconfig (boot with SPL) or
> stm32mp15_trusted_defconfig (boot with TF-A).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> ...
>   configs/stm32mp15_basic_defconfig   | 1 +
>   configs/stm32mp15_trusted_defconfig | 1 +
>   2 files changed, 2 insertions(+)
>
Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

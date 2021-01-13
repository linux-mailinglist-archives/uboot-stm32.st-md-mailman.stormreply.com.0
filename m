Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1F02F485A
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Jan 2021 11:14:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C29B1C32EA8;
	Wed, 13 Jan 2021 10:14:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 056A2C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 10:14:17 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10DABxMI028045; Wed, 13 Jan 2021 11:14:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bHsRRyGK28I4TE5FHi1RkrCEAY6dMVLWUdHavayYXHU=;
 b=4lHGKpZwvDrdFdlDr8LJW3hOEAGS6rfhERBtTuanjiUNShSY0PoflLL/gX5HQWl+U2LB
 9DLZQNlaZwpBl7MkdEfUHSBQCisRyswv3s5AMLqUc2R6ah4NQxuP8DxHxc5rtF5E7aNk
 fipdO4st5LxCaOKDa9cGiwGo7QtQcOtuwT/WTMMgt5ZBrsKOsJN3RqLeH8o9bz66IAcC
 lzEbpqUT+ZsfsdIWhvlGdb8R13cnk/vQjy0Q0kHJH2DduR24UKkD1Cm3Y2aRH+LdidwO
 Xg0siET6+koecTood1IXdfW9q53CKVrx2Qb4+u8jFsdLSSUeFLxNv8BNzmlc3bMwV+1Y 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5gx5tdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 11:14:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B000410002A;
 Wed, 13 Jan 2021 11:14:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7EAE2231DCD;
 Wed, 13 Jan 2021 11:14:10 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Jan
 2021 11:14:03 +0100
To: <u-boot@lists.denx.de>
References: <20201211133612.1.I5168c97ed041354102af2ba6ba3f5b3e5d0b9a47@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <cf31b8b6-666c-0efc-2e06-c9a2d6fc42bb@foss.st.com>
Date: Wed, 13 Jan 2021 11:14:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211133612.1.I5168c97ed041354102af2ba6ba3f5b3e5d0b9a47@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_05:2021-01-13,
 2021-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp: stm32prog: always flush DFU
 on start command for uart
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

On 12/11/20 1:36 PM, Patrick Delaunay wrote:
> From: Patrick Delaunay <patrick.delaunay@st.com>
>
> Remove the test on data->dfu_seq, because dfu_seq=0 not only when
> the DFU is not started (mask with 0xffff). This flush is mandatory
> as the final treatment, common with USB, is done in DFU callback.
>
> This patch avoids issue if the received length is a multiple of
> the DFU packet.
>
> For example if size of bootfs partition is egual to 0x4000000,
> data->dfu_seq=0 at the end of the partition, the flush it not
> requested and the phase is not increased in the callback.
> U-Boot continue to request the bootfs in the next GetPhase command.
>
> Fixes: 468f0508b58b ("stm32mp: stm32prog: add serial link support")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   .../mach-stm32mp/cmd_stm32prog/stm32prog_serial.c   | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

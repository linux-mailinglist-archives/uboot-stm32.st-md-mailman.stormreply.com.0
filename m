Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D6D3942A3
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 May 2021 14:36:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6116C57189;
	Fri, 28 May 2021 12:36:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBED2C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 12:36:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SCSPPJ031122; Fri, 28 May 2021 14:36:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=uL8koY3J+UDAD05CxlqRS02zsHdKYBWYG03k8HKir4k=;
 b=N1/qBGmPrzC/4ZdJJXV7CRpmi4H93KQ2J0sRuMMMysliCMqOvridaEzB/M0LbIeQjXKm
 3k7TFXZYeRFkFVNlnPbbfeWhrRVxsYiYWR5RDxXI23KtrF90M8jlozWNuMxEgEGPSRSD
 /0oYTCdq+KBHobzHVdgxfs2kuRkjUwiaqUDxssKwtN7Wq2AEVmVfr0x2mmv2GTYajyGn
 55TX/IHrzMKC1sA3bbYFtuxgEP4E8r3pZZGAJkEyoI005zs2ecS7AHCRPplDENB7ivRk
 LUkI8NfG19pCgLGQrBWs6oKEyUsEODHQjHs1NVJ7b+y9fFiyPshzaYnlPEg6kTZ/hFy1 BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38ttn0284d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 14:36:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E19E10002A;
 Fri, 28 May 2021 14:36:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A6008228123;
 Fri, 28 May 2021 14:36:24 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 14:36:24 +0200
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210428114245.21229-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <e6e458d5-3723-9f2b-dadf-ee36fd07e30d@foss.st.com>
Date: Fri, 28 May 2021 14:36:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210428114245.21229-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_04:2021-05-27,
 2021-05-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Pankaj Dev <pankaj.dev@st.com>
Subject: Re: [Uboot-stm32] [PATCH] reset: stm32: Fix bank and offset
	computation
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


On 4/28/21 1:42 PM, Patrice Chotard wrote:
> BITS_PER_LONG is used to represent register's size which is 32.
> But when compiled on arch64, BITS_PER_LONG is then equal to 64.
>
> Fix bank and offset computation to make it work on arch32 and
> arch64 and ensure that register's size is always equal to 32.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> ---
>
>   drivers/reset/stm32-reset.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D20412F4822
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Jan 2021 11:01:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E34DDC32EA8;
	Wed, 13 Jan 2021 10:01:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C41DC36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 10:01:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10DA1uk7013763; Wed, 13 Jan 2021 11:01:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0lYYg68CqGvGI1jT8OC5Z+TQNC7PM5YgV6vjJerb67c=;
 b=oYi4BnX5n6G5Yn3uTKNjkOflDc8O8uqoq5TAnxy8VHq7ew5LEPSI+OMIWWaYtAxeTUy5
 oENIYS18Sie9CKMBRetsgz3TfyUN4PQlkeAXFRqeAfGO3aVX0bFq39IkEdCvFUcKUaZn
 Etqtr0sELP0bMyD29FUCSvk6qv/rOiZTuFiIzNGLGfLmPb/g9wvzKMgnSyeN4NRuJpRs
 J6mgsq1cSC3mYCulXtgrhDS3Ac9XYVLllmO9rAWiyE4SBg//XUIPzVRFM4Jb0UJqcNhF
 f2ZUiARQjt4/RslOAluOUoRSdr91QJqq+aM9U+CW5gcphU0BpvrxTzv3P020wyNXWM4d BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5h2npby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 11:01:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4326110002A;
 Wed, 13 Jan 2021 11:01:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 251BD23082A;
 Wed, 13 Jan 2021 11:01:56 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Jan
 2021 11:01:05 +0100
To: U-Boot Mailing List <u-boot@lists.denx.de>
References: <20201016092843.1.I5e39774367f1ea4e7c390f69ab3f86a79b66b8ce@changeid>
 <0295af748c5145f9ab0c4288f68aa1a9@SFHDAG2NODE3.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <6b67c793-34b5-7134-9125-59efd80ab1c2@foss.st.com>
Date: Wed, 13 Jan 2021 11:00:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0295af748c5145f9ab0c4288f68aa1a9@SFHDAG2NODE3.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_05:2021-01-13,
 2021-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32pm1: update USB-C power
 detection algorithm on DK boards
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


> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: vendredi 16 octobre 2020 09:29
>
> USB-C power supply which are Power Delivery compliant (USB-PD) are able to provide different voltage/current (for example 5V/3A 9V/3A 12V/2.25A...)
>
> In this case, the power supply need to negotiate the voltage/current to use with the device using CC1/CC2 USB-C signals.
>
> If this negotiation occurs during ADC measurement (done also on CC1/CC2 USB-C signals) some ADC acquisition can be corrupted which cause wrong power supply current detection.
>
> To avoid this, the power supply current detection algorithm is updated as following:
>    - perform an ADC measurement, if a 3A current is detected, continue the
>      boot process.
>    - else, wait 20ms (max tPDDebounce duration) to ensure that USB-PD
>      negotiation is done and perform another ADC measurement.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
>   board/st/stm32mp1/stm32mp1.c | 106 +++++++++++++++++++++--------------
>   1 file changed, 63 insertions(+), 43 deletions(-)
>
Applied to u-boot-stm/master, thanks!

Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

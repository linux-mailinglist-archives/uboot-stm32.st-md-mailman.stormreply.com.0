Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3F2387A5B
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 May 2021 15:46:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BA8CC57B74;
	Tue, 18 May 2021 13:46:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB120C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 13:46:17 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IDi9V4023623; Tue, 18 May 2021 15:46:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=1t6XYHnMzQ2nVUvYv7h1E/1JcM5tj9M2DqGAAn1QOCU=;
 b=tm+1K5/Bl+r55zAXklj+jGGJlTfRCMRuVuS7gScp2pG9qF0lbMco4rjrsjXNRLc0/xcs
 SfDTvLjfvPOsazsG/xPvUOImJCPHUmUVO2EYkVHGnv4v8mqzQoYiScSPahBy3/9Wl8GC
 eTkCIeIDNf1qKW9+G41tvPfCqCtTApODvFBirO9NWHDPlnMyPd3/bwzPjTdbCANGihc3
 0m9+aqIILGKbeuKeVYLZxelcSVpl1+vo0OXXcKLD+LrXePb0cZzCwcqD3+SbpJFBgIzz
 +EtFoaApHBmJQkZbD7+DvebEnzIT61o6/XJGy4OzRLvV95dWCbSwKTgbLsz5E19ApWLH pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38m4673n1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:46:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7AF5F10002A;
 Tue, 18 May 2021 15:46:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E7B2227D9C;
 Tue, 18 May 2021 15:46:15 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May
 2021 15:46:14 +0200
To: Simon Glass <sjg@chromium.org>
References: <20201028100640.13876-1-patrick.delaunay@st.com>
 <20201028100640.13876-2-patrick.delaunay@st.com>
 <CAPnjgZ1wjs6t7G=oYArzc9j7P-KHg4BsVeLcmRzn2mogeEP05g@mail.gmail.com>
 <67cc4f09-85cd-c145-c851-faf153c1de8d@foss.st.com>
 <CAPnjgZ3E2-WALbbSqzOn=kWe_GDUM88urkC8GUNjU=NzFFC-aA@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <96581a4e-2407-f1f9-e956-42194f8db288@foss.st.com>
Date: Tue, 18 May 2021 15:46:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ3E2-WALbbSqzOn=kWe_GDUM88urkC8GUNjU=NzFFC-aA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_07:2021-05-18,
 2021-05-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] cmd: pinmux: support pin name in
 status command
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

Hi Simon,

On 5/6/21 5:02 PM, Simon Glass wrote:
> Hi Patrick,
>
> On Thu, 6 May 2021 at 02:38, Patrick DELAUNAY
> <patrick.delaunay@foss.st.com> wrote:

...


> Any reason to prefer C test to python...
>
> I just complete the existing pinmux tests.
>
> For performance ?
> I wrote this up here:
>
> https://u-boot.readthedocs.io/en/latest/develop/tests_writing.html
>
>> other pinmux tests in already python should be migrate also ?
> They may as well be, to the extent that they only run on sandbox.
>
> Regards,
> SImon


I discover this page, it is clear now.

And I will chaneg the test to C.

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

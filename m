Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 491A93CB432
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jul 2021 10:29:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 101D5C59783;
	Fri, 16 Jul 2021 08:29:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E14CC59781
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jul 2021 08:29:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16G8STPD026906; Fri, 16 Jul 2021 10:29:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=djibP5aS9CiiVrDaji1UNUn8NL6w0oxUSubfg13h+tw=;
 b=jWM1TSdDugR0QqFDHAAcZ05ZOFr06zHJ72znRjO9xNahklZDMZuseiEo4VDXNVupkVXK
 mwFfe1USYkE74d6Caz0gEzQs6wgVYN7OnJ7zjbypMJ5mQESs9DHzAEJ2zzhp9hctBg7y
 cmym10EtL3zpYh29ymRJPB4/aIc696xcTCXa+tUkckAPm8PQ75oXJedd59bih+FKWnOs
 WVFIX44Dl1+a6tdhlzityjpQh/h7buQ01aktPLAsG3ldLRX8pLQ1EUIs8mY5EvFFPTi5
 Bz/iYP6cMltDmt9ptXMeJTRZiGIp0P94TbyhI0O8G20Q7AfR5dkWF59DrRnJS4udgpGS PQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39tw1kauvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:29:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2874610002A;
 Fri, 16 Jul 2021 10:29:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 171C3218C9E;
 Fri, 16 Jul 2021 10:29:00 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Jul
 2021 10:28:59 +0200
To: <u-boot@lists.denx.de>
References: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
 <20210628145519.7.Ice24ec3430539077cefa5a43cb6245847db3871e@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <75a8f32f-037b-7dae-8481-c1be01cb5eb4@foss.st.com>
Date: Fri, 16 Jul 2021 10:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628145519.7.Ice24ec3430539077cefa5a43cb6245847db3871e@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_02:2021-07-16,
 2021-07-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 7/7] stm32mp: cmd_stm32key: add subcommand
	close
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

On 6/28/21 2:56 PM, Patrick Delaunay wrote:
> The expected sequence to close the device
>
> 1/ Load key in DDR with any supported load command
> 2/ Update OTP with key: STM32MP> stm32key read <addr>
>
> At this point the device is able to perform image authentication but
> non-authenticated images can still be used and executed.
> So it is the last moment to test boot with signed binary and
> check that the ROM code accepts them.
>
> 3/ Close the device: only signed binary will be accepted !!
>     STM32MP> stm32key close
>
> Warning: Programming these OTP is an irreversible operation!
>           This may brick your system if the HASH of key is invalid
>
> This command should be deactivated by default in real product.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/cmd_stm32key.c | 54 ++++++++++++++++++++++++++--
>   1 file changed, 52 insertions(+), 2 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

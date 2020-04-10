Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC891A48CC
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 19:08:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72C03C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 17:08:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB3BCC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 17:08:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03AGbKsB011557; Fri, 10 Apr 2020 19:08:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=TcyCBP1nPFRcK8bF35S9cRaED3CJhsqliighd6kmRgk=;
 b=Mo8e2TA272/toRlid0WIrc+uB9764zYtlKfCg6/7NSn5E39eK+HEsZlaUgWPVK3FlB0y
 SE+SJZf3rl8XnfmH4eCf3iwx1RwWfuoqmtTPEJsKg5llPlIJrJmAhzCxMA3FyLzAzoLz
 QOWx6bHl40eEaRRkrlQONULT9djkMoBg1W13Tnk6iwODPgfJXmHaT2FRKOiilUkAx7Tz
 vjrw7DnXjGt+PmXjy2N0Q3vujO5PvQBB8sbrmvMuCOnwVA47KXjous3XqSW6FhXRwqgd
 VCV8dDHY9H8iJB6wjIeuWJTWGcjLdS42wBviGxmvqTH5AmOe68F+H/TN5HayJIG5+qg4 ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 309vr9eb88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2020 19:08:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3DB6310002A;
 Fri, 10 Apr 2020 19:08:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3257E2A5F20;
 Fri, 10 Apr 2020 19:08:34 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 10 Apr
 2020 19:08:33 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 10 Apr 2020 19:08:33 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Anatolij Gustschin <agust@denx.de>
Thread-Topic: [PATCH 08/16] board: stm32mp1: update management of boot-led
Thread-Index: AQHWB3YhCj3z7mlc1U+s4eUHyAW7dKhkBREAgA6fWVA=
Date: Fri, 10 Apr 2020 17:08:33 +0000
Message-ID: <cbe5ca145dba4cb48efa71929422cdf6@SFHDAG6NODE3.st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.8.I15cb0a6245fb4cd5d23371683c2697f794adf306@changeid>
 <20200401134328.06324355@crub>
In-Reply-To: <20200401134328.06324355@crub>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-10_06:2020-04-09,
 2020-04-10 signatures=0
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 08/16] board: stm32mp1: update management
	of boot-led
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

Dear Anatolij

> From: Anatolij Gustschin <agust@denx.de>
> Sent: mercredi 1 avril 2020 13:43
> 
> Hi Patrick,
> 
> On Tue, 31 Mar 2020 18:04:25 +0200
> Patrick Delaunay patrick.delaunay@st.com wrote:
> ...
> > @@ -648,8 +652,10 @@ int board_init(void)
> >
> >  	sysconf_init();
> >
> > -	if (CONFIG_IS_ENABLED(CONFIG_LED))
> > +	if (CONFIG_IS_ENABLED(CONFIG_LED)) {
> >  		led_default_state();
> 
> Did you verify that this works like expected? We either use
> 	if (CONFIG_IS_ENABLED(LED))
> or
> 	if (IS_ENABLED(CONFIG_LED))
> 
> Please check.

You are right: it is not working.

I had already make this error,
I will solve the issue a in separate patch (also impacting dh_stm32mp1).

Thanks for review.

> --
> Anatolij

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

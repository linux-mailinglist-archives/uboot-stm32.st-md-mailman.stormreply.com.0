Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A03C17DA1D
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Mar 2020 08:59:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D69EC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Mar 2020 07:58:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E169EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2020 07:58:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0297vwOX003758; Mon, 9 Mar 2020 08:58:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=GYzHj0RW8J1xtylYgpMmQSim0XxiISDKd7avgOxOzRA=;
 b=bHkr5Oy45rHJFhyXOFX4+vie1In2pYpib3yxh59n0jt0m7alBml1ctKUk7N9Om7mh3K5
 65AT1wkZGbIt87Lpbjn6gjciat8uWMZPOSPHHnrEjchth4tDRjtuB+AVKtX/4d/B9oAC
 dqcrUUqZhmcyQZceLpN6DrD7RHhl/OgXYRfRxYzGIhsBTHpBRxaO9DNI4NGrnf9MBQr8
 jJmSTQnmxWX46mtolmybHQEzsgO5h0urOBhgWSO1XnTIaMa8r0ZO4Qq8Q/oUGWpcUk7C
 Q4ATNvBnr8pOGeFZYyx0GDfgWu88CN2lyTteGq65gJBkEQvGOQSdI18qwoDwX7aBlK0g RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym1mgjmb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2020 08:58:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E042F100040;
 Mon,  9 Mar 2020 08:58:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CABD621F68C;
 Mon,  9 Mar 2020 08:58:44 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 9 Mar
 2020 08:58:44 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 9 Mar 2020 08:58:44 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Stephen Warren <swarren@wwwdotorg.org>
Thread-Topic: [PATCH v3 4/4] board_f.c: Insure 16 alignment of start_addr_sp
 and reserved memory
Thread-Index: AQHV8+OTU+tDsLi0TUa6q2xGm/qJCqg73iuAgAQKJlA=
Date: Mon, 9 Mar 2020 07:58:44 +0000
Message-ID: <e7522fc1aa9949d981e5e61ef87cc90c@SFHDAG6NODE3.st.com>
References: <20200306181758.12336-1-patrick.delaunay@st.com>
 <20200306181758.12336-5-patrick.delaunay@st.com>
 <958c22f8-9736-bfd6-ffe7-9c49660d54ed@wwwdotorg.org>
In-Reply-To: <958c22f8-9736-bfd6-ffe7-9c49660d54ed@wwwdotorg.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-09_02:2020-03-06,
 2020-03-09 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ovidiu Panait <ovpanait@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 4/4] board_f.c: Insure 16 alignment of
 start_addr_sp and reserved memory
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

Hi,

> From: Stephen Warren <swarren@wwwdotorg.org>
> Sent: vendredi 6 mars 2020 20:14
> reserved memory
> Importance: High
> 
> On 3/6/20 11:17 AM, Patrick Delaunay wrote:
> > Add a function reserve_stack_aligned() to reserved memory with 16 bits
> > alignment after the stack pointer (gd->start_addr_sp) and use this new
> > function in board_f.c to reserve all the memory area (malloc, board,
> > gd, fdt, bootstage, stacks).
> >
> > This 16 byte alignment is needed for cast on struct pointer for the
> > reserved memory, for example:
> > + x86_64 ABI: https://reviews.llvm.org/D30049: 16 bytes
> > + ARMv8 Instruction Set Overview: quad word, 16 bytes
> >
> > An other alignment value could be needed for other architecture.
> 
> I think the series look OK, so,
> Acked-by: Stephen Warren <swarren@nvidia.com>
> 
> 
> Nit: Ensure not insure, in a number of places.

Thanks for the review,
I will update the errors (s/insure/ensure/)

Regards,
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

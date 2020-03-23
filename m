Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4CB18F155
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2020 10:00:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FD27C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2020 09:00:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE9ACC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2020 09:00:05 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N8qcnE027276; Mon, 23 Mar 2020 09:59:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=mu7jhg3xlVLgnlFOyfig3selRWTOWYKrVxBPFiYPiBI=;
 b=NyeFin+XuDyk/je6s55Eb1DXKGWmikqh/2SwLIMdEIOasDbyWxs5eZp1FalGaWlVUCcl
 twr8QLkYgDPpEg3ojitgln+GGStCe5rhwCYSsJxB42F30PcK3v3PfLgdIvNqVxqESex5
 X7du0FQNosKx7Df5v0KLSfgNKcRj2FiB95OPRf1UoYjSjvz4DQLk1QqWWEbUgLaejaNc
 OY840urewtNrcA3XMwZ/daUHcWDTDg+zr+0ikO32Yk+tFjHItU+p5ATPLHmdJbuhqJyS
 GCHVUFjTBOAvzRfOKMlo3KqW/I3ufDM2b152aUh9py9p/lgFwugKFRuRX3lowBuRT8Dw Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw9jyrwkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 09:59:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 77A94100034;
 Mon, 23 Mar 2020 09:59:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 617352A9BC9;
 Mon, 23 Mar 2020 09:59:54 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 23 Mar
 2020 09:59:54 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 23 Mar 2020 09:59:53 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Wolfgang Denk <wd@denx.de>
Thread-Topic: [PATCH 07/10] board: stm32mp1: add finished good in board
 identifier OTP
Thread-Index: AQHV4dOJFMqSQuMDi0GTaKvIgTu+3ahOUBcAgAF81JD///wBAIAGVcww
Date: Mon, 23 Mar 2020 08:59:53 +0000
Message-ID: <4bc1f59a38194c8cb5ec7d07f45e2945@SFHDAG6NODE3.st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
 <20200212183744.5309-8-patrick.delaunay@st.com>
 <20200318104452.3B6E824003E@gemini.denx.de>
 <07159b22a76a445089aa6cd646c0ef1c@SFHDAG6NODE3.st.com>
 <20200319091336.CFD5E24003E@gemini.denx.de>
In-Reply-To: <20200319091336.CFD5E24003E@gemini.denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_02:2020-03-21,
 2020-03-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 07/10] board: stm32mp1: add finished good
 in board identifier OTP
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

Hi Wolfgang,

> From: Wolfgang Denk <wd@denx.de>
> Sent: jeudi 19 mars 2020 10:14
> 
> Dear Patrick,
> 
> In message <07159b22a76a445089aa6cd646c0ef1c@SFHDAG6NODE3.st.com>
> you wrote:
> >
> > > I can't parse the sentence above, sorry.
> >
> > It is a part of the codification used in production of ST board, sorry if it is not
> clear.
> 
> I see.
> 
> Please add suich explanation to the commit message and maybe even comment
> in the code.

Sure, I will add explanation in commit message and in "cmd_stboard.c" file header.

> Best regards,
> 
> Wolfgang Denk
> 
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
> Everyone, in some small sacred sanctuary of the self, is nuts.
>                                                          - Leo Rosten
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

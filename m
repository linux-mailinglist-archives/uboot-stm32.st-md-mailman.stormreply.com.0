Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8172190827
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 09:51:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF961C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 08:51:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7819DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 08:51:32 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O8ldAM004097; Tue, 24 Mar 2020 09:51:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=woXs9iR8GAKmEkEGYO3zKfwFzMBdPTEQ9pBBdPay+Y0=;
 b=XRmuXbXtb8lOBkBlZamcdZeZWXP3mTYqRARWHc3uyOGegH0k69qbD9XOEhEYg+rCm53r
 TDpTiAjJCbdwDi6Ne054ZmDEM8oSnZBLN/mzF3fBMYj4/FtJFVHu6nLzhaEzLMZOqG6w
 R4d+O72F0uVnJe5okGlKnttTUqrQLzXwEdjnSKVXmsPUxk/YFxHjTSkQ8B3saW991Mf8
 G7toqyKstgzNkgFT2QmNISZOCMRXrj6UczhSKc71Gs/oArm7DsHvbe0Zz5EJTWFGwv0g
 g37GTQM6K6norLP5xe+o2CqZ2zypUcxVFFVaWmLTTqNy4XmABGGjrT90cfJ/kJnKj4mC 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw995eeyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 09:51:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DFFA0100038;
 Tue, 24 Mar 2020 09:51:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D78442126CE;
 Tue, 24 Mar 2020 09:51:29 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 24 Mar
 2020 09:51:29 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 24 Mar 2020 09:51:29 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 8/9] ram: stm32mp1: reduce delay after BIST reset for
 tuning
Thread-Index: AQHV86AJEKr6O/+21U2NlE768upGN6hXi3sg
Date: Tue, 24 Mar 2020 08:51:29 +0000
Message-ID: <601389fa73764f41b6ee7568e1a2553e@SFHDAG6NODE3.st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
 <20200306111355.8.I2ed443e2c15db6b007f836254b3753da9b06e76d@changeid>
In-Reply-To: <20200306111355.8.I2ed443e2c15db6b007f836254b3753da9b06e76d@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_02:2020-03-23,
 2020-03-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 8/9] ram: stm32mp1: reduce delay after
 BIST reset for tuning
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

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: vendredi 6 mars 2020 11:14
> 
> Reduce the delay after BIST delay, from 1ms to 10us which is enough accoriding
> datasheet.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm/next, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

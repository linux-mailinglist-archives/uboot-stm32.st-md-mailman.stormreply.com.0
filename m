Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E71E32C3DB5
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 11:32:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE8DEC424AF;
	Wed, 25 Nov 2020 10:32:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C96FFC36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 10:32:44 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0APAWMqT020366; Wed, 25 Nov 2020 11:32:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nYusWEpWeKQTsbGw1aCn7J4UFcwPFWzlGF9z+A1s4Ik=;
 b=DiK0rkLy91+QNOA7Ku9dGYAGV/qrSb+V6DE86HK6bRUeCRJXN/f79a/tcjqZF4kuSulw
 J+C+s6PmiMLsAKl8dZzGkNRhp5a/oNL8Zb6zmuDhQ3Gft3LFsf5mTW6Qfg9cnXRWJ6w/
 q7fGMvt4gdgk53+czny+4/EEA0uub0/QWAsSHCJt0ezzV67IJDFczOF1rsjKXIaggb1y
 RkWsl6BLvp8BrC/JpyiNEFsSgRePSZp3OUfcJ2F10smBDawHwIYblliTy4Zeu1fl66TF
 OlEGIi//ITZnpi+oKKlUJIRRRBDDJ4yoLomTZug1xvXSY2/BykYCZASO0CKwQ68eaqup OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y05hdbwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 11:32:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB21110002A;
 Wed, 25 Nov 2020 11:32:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2DB52348AA;
 Wed, 25 Nov 2020 11:32:16 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG1NODE1.st.com
 (10.75.127.1) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 11:32:16 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 11:32:16 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/3] remoteproc: stm32: update error management in
 stm32_copro_start
Thread-Index: AQHWovNEog8ZpEiWnkWZf0P957EgBqnY5nfA
Date: Wed, 25 Nov 2020 10:32:16 +0000
Message-ID: <7f670edf7b15459eae86ea541f4b8593@SFHDAG2NODE3.st.com>
References: <20201015150101.1.Ic4f6a36fa0594203b3f994a9e1d48143b420f072@changeid>
 <20201015150101.3.If11081706d310a6eb7ed2ba30291bdd20e74927b@changeid>
In-Reply-To: <20201015150101.3.If11081706d310a6eb7ed2ba30291bdd20e74927b@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_06:2020-11-25,
 2020-11-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Fabien DESSENNE <fabien.dessenne@st.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] remoteproc: stm32: update error
 management in stm32_copro_start
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
> Sent: jeudi 15 octobre 2020 15:01
> 
> The coprocessor is running as soon as the hold boot is de-asserted.
> 
> So indicate this running state and save the resource table even if the protective
> assert, to avoid autonomous reboot, is failed.
> 
> This error case should never occurs.
> 
> 
> Cc: Fabien DESSENNE <fabien.dessenne@st.com>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/remoteproc/stm32_copro.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

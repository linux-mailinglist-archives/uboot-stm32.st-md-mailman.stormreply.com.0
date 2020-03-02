Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D558A17560E
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 09:35:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CC6AC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 08:35:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 088D3C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2020 08:35:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0228RYZ0018192; Mon, 2 Mar 2020 09:35:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=+ru7llcLYtV+VkxzLgz322ocfFIn00dreyPEpGQr29Y=;
 b=DbL8Gnh5DMKMFkL6P1dNrOD5ZkWSSO/J1qFw3/Dz4YrwGbpAOOu74vhJtjsb5iADdlQa
 B7+8q+zrz747AXiz7oydeHWz61XkKf/gGhZBrMeGdVE2KibRjCyOT5vFIkUSbwlx5lbS
 yb8R60fV8nsGX14cYMvcjpq9qBFMJGDVYJ2J+ruFZIZiKf4rLJSPJQAaxN9q8/DBB2+w
 6YjjnloJrYEcmlXOBDGbtEP3PeZ/xM7VrGUV4CfAfkUMFvCLVUCzwHv+aRB9VXMc37PQ
 ts96R57xUW9G7E7n9GasmtMzfIm5f9oPNvRkKqFuXRs43//QJgiG6WUZjcbFtNgAqWVq fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yffqpj3wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2020 09:35:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 64B9F100034;
 Mon,  2 Mar 2020 09:35:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C1E22A7766;
 Mon,  2 Mar 2020 09:35:16 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 2 Mar
 2020 09:35:16 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 2 Mar 2020 09:35:16 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] configs: stm32mp1: Resync with savedefconfig
Thread-Index: AQHV69x25nMmpYV6hESp433r5ncogqg1AxdQ
Date: Mon, 2 Mar 2020 08:35:15 +0000
Message-ID: <e8553a1504c74948b44c74632df31c5c@SFHDAG6NODE3.st.com>
References: <20200225130654.19740-1-patrick.delaunay@st.com>
In-Reply-To: <20200225130654.19740-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_02:2020-02-28,
 2020-03-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp1: Resync with
	savedefconfig
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: mardi 25 f=E9vrier 2020 14:07
> =

> Rsync all stm32mp1 defconfig files using moveconfig.py
> =

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---


Applied to u-boot-stm32/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

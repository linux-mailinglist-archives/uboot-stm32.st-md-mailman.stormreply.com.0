Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9E615C8EB
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 17:54:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4FC8C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 16:54:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EB94C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2020 16:54:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01DGoPpN008733; Thu, 13 Feb 2020 17:54:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=QMNJjrbHePrhG/0I/rVawwsoq63EBoC4gThXJP99mBg=;
 b=AXsMfr4h6xTki/LpLUu2RnEREdbBwdqfuTTXn/Ful5s7jWXcWGFtxiDiYcGJwkcWimye
 MmY5uOu9yjpWZx88hC+O2ULJia8Sde+wfm0KJjrr4FMhnwOWjtbfoAVqbUPkcu6TQUox
 Vt4TpgTC/gnXX0iefibX3lFIjb7HUBEKefHtkknNYKBjD/0QYZq7Xm4KuW9XUuqR8Y6G
 MPlFRvwjeu95YaT9uxY1Aprb+zp2n3SLRzdXULmH4bJqvw64iS9yw90NnW7NoavGyGjx
 N4Sh/HopZKJWl3mPS11Qo7hkJFumtTSUPBeZpg6MA/uKNI6IAIhG0XmezoRzPeR9YdS6 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uvdx3h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2020 17:54:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C13710002A;
 Thu, 13 Feb 2020 17:54:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 441862C60AC;
 Thu, 13 Feb 2020 17:54:51 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Feb
 2020 17:54:50 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Feb 2020 17:54:50 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] board: stih410-b2260: remove fdt_high and initrd_high
Thread-Index: AQHV2ppgPUSOy8VfkE+JBIKcDErZNKgZZycQ
Date: Thu, 13 Feb 2020 16:54:50 +0000
Message-ID: <b03956747bec4d13953a2bf75026897d@SFHDAG6NODE3.st.com>
References: <20200203140059.2111-1-patrice.chotard@st.com>
In-Reply-To: <20200203140059.2111-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_06:2020-02-12,
 2020-02-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stih410-b2260: remove fdt_high and
	initrd_high
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

Hi Patrice,

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: lundi 3 f=E9vrier 2020 15:01
> =

> Remove fdt_high and initrd_high as they shouldn't be used, this allows th=
e fdt and
> initrd relocation.
> This implies to set CONFIG_SYS_BOOTMAPSZ to indicate the amount of
> memory available to contain kernel, device tree and initrd for relocation.
> =

> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

Regards,

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

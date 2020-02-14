Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFEB15D77B
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 13:34:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDA4DC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 12:34:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A756C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 12:34:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01ECXCSs007761; Fri, 14 Feb 2020 13:34:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=AV2pC6chOEh2BaLwAQwnxLflLSH8hillDr8ARAlrGOI=;
 b=famCHcdk08R4gfXxhh+LnCiyStwXd1fyPVYWB6nvpaNKFRC8u6zIN/RVgbWQEQdFuyGw
 f5mYnzyZDTWVe0uj8UdDoMjDdFk3aojTqGxhYut2SVyhQKFhRK1+UA2I7VT0CORY0r7d
 44xAGLV0oTx8WdPTb3sV5AbnhtjZzSw8d4e+eO5FYXWddaJNZ61ZrK8B3RKX4NM/zNX8
 ncNh/wTP4EI0ygvqTpWKbkGCfXkxiaNv+w/+1T7yBRyqoKSGpiWhiXPQBLQCThbUuard
 3OAlGWTGWCmVVLGx5fjgJWkX7J00jUlhbnBCO0s7ESznskxb4aas/HvONVao8cLM7imz EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1udabpns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 13:34:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 16EDB10002A;
 Fri, 14 Feb 2020 13:34:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E91C2B207E;
 Fri, 14 Feb 2020 13:34:40 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 14 Feb
 2020 13:34:39 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 14 Feb 2020 13:34:39 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v1 1/2] board: stm32: fix extra env setings addresses
Thread-Index: AQHV2pu6k0E2gB6vGEWVTju08ECWsKgasL1A
Date: Fri, 14 Feb 2020 12:34:39 +0000
Message-ID: <e98b0788dddc4c96a265b81e3d1228ed@SFHDAG6NODE3.st.com>
References: <20200203141040.3236-1-patrice.chotard@st.com>
 <20200203141040.3236-2-patrice.chotard@st.com>
In-Reply-To: <20200203141040.3236-2-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_03:2020-02-12,
 2020-02-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/2] board: stm32: fix extra env
	setings addresses
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

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: lundi 3 f=E9vrier 2020 15:11
> =

> For stm32f4, f7 and h7 boards, reserve:
>  - 4MB for kernel
>  - 64KB for fdt, boot script, pxefile
>  - the remaining memory for ramdisk
> =

> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---

Applied to u-boot-stm32/master, thanks!

Regards
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

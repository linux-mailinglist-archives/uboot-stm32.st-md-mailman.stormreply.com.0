Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CC41907CC
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 09:38:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FFC8C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 08:38:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C88A2C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 08:38:33 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O8SmIb023497; Tue, 24 Mar 2020 09:38:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=lsIXMTuyN4Hy6A4KI2AtWtmhNNkC8VrAfKHdHekNeNY=;
 b=HYnM0kPngDRP29yFcgjsQrbmCff3NGQZOo8HwwlbDI76nfRYbQkeAw6EEA4t0NV3A85h
 p0YHlky+2HM4qJJvnBcYAuNe2mnyEYnZKuZUUCEGk4VVk7V9/xWKw+KxLhivYllzWbwE
 L8Z20ixq4QWsX9s9qgDIWRWnkn9Z+eO19KRl46ukhnPUzLGhhvfsCk06xtpAxf3BAe0P
 04kvrtilHYY1hL2wgBZSYOD6Owg/yjD5LGVSZRLaoa35f4ccLgGSApM2qOyPhi0CcL5S
 t8yBZLO9vXKoiYD/RKSxSB7lhSjrMeM+Bklj7KOsrMbJIA7SxUyXtUjgjFJ8qhPJCIVV DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw9jyxawb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 09:38:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B32AC10002A;
 Tue, 24 Mar 2020 09:38:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A870D21F697;
 Tue, 24 Mar 2020 09:38:26 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 09:37:47 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 24 Mar 2020 09:37:47 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 10/10] arm: stm32mp: fdt: update kernel device tree
 according the part number
Thread-Index: AQHV4dOLbT76UZWuUECZt8hePNau36hXqzkw
Date: Tue, 24 Mar 2020 08:37:47 +0000
Message-ID: <1d770565776c4c19b0b23a6c9bfaaccd@SFHDAG6NODE3.st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
 <20200212183744.5309-11-patrick.delaunay@st.com>
In-Reply-To: <20200212183744.5309-11-patrick.delaunay@st.com>
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
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 10/10] arm: stm32mp: fdt: update kernel
 device tree according the part number
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
> Sent: mercredi 12 f=E9vrier 2020 19:38
> =

> Update the kernel device tree for STM32MP15x product lines according the =
used
> soc and its part number, when CONFIG_OF_SYSTEM_SETUP is activated:
> - STM32MP15XA hasn't Crypto (cryp1/2)
> - STM32M151 and STM32M153 hasn't 3D GPU and DSI host
> - STM32M151 hasn't CAN FD and has single A7
> =

> For example:
> =

> FDT: cpu 1 node remove for STM32MP151AAA Rev.B
> FDT: can@4400e000 node disabled for STM32MP151AAA Rev.B
> FDT: gpu@59000000 node disabled for STM32MP151AAA Rev.B
> FDT: dsi@5a000000 node disabled for STM32MP151AAA Rev.B
> =

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm/next, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

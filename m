Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 223FD15D77F
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 13:35:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E04C7C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 12:35:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18DA6C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 12:35:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01ECWW2l019009; Fri, 14 Feb 2020 13:35:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=3XPrODCZY+ZhBy74/bXs4WzURc9O32j0l0ddak58NZA=;
 b=FSALAqqwNcZc0ruLuG73CKERuaIAplYcaBSNYb9AZ8cKGdlevfLmVbs2ExbzKWzDjqGs
 WEdg8NP23PeEafJD7s7+xJYYlOjrJpzTmIyV8qCBDf8Eeqof0aqEw3n+e2YLJiRqcAgI
 9V5Ly6rutzYQ8Hif6h1UkyQjGm/GM1lgYgXy3JqKuXu6fsGwFvgfq2OWncBImyj0gbvV
 Elxm1QV9ZQZeeTYEajLWAVWakUGkgnq9Vt4iux3Nq9Bzkm4j5kOa73fnANImcD2Cc7Jh
 hRraKPMT6E82EMhnPNoxkKmmQN3yzpjzxcCxnYkhlyB3SXiN5Gn2S0l39AS9DACPJl+W SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uve3ebn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 13:35:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DEF0610002A;
 Fri, 14 Feb 2020 13:35:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D85702B39E6;
 Fri, 14 Feb 2020 13:35:26 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 13:35:26 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 14 Feb 2020 13:35:26 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v1 2/2] board: stm32: remove fdt_high and
 fdt_highinitrd_high
Thread-Index: AQHV2pu6IK/MEv1lL0eT1nA/fiAqKqgasQkg
Date: Fri, 14 Feb 2020 12:35:26 +0000
Message-ID: <ac9aa3f862cd4ac7b01677fb17c40516@SFHDAG6NODE3.st.com>
References: <20200203141040.3236-1-patrice.chotard@st.com>
 <20200203141040.3236-3-patrice.chotard@st.com>
In-Reply-To: <20200203141040.3236-3-patrice.chotard@st.com>
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
Subject: Re: [Uboot-stm32] [PATCH v1 2/2] board: stm32: remove fdt_high and
 fdt_highinitrd_high
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

> For stm32 f4, f7 and h7 boards, remove fdt_high and initrd_high as they s=
houldn't
> be used, this allows the fdt and initrd relocation.
> This implies to set CONFIG_SYS_BOOTMAPSZ to indicate the amount of
> memory available to contain kernel, device tree and initrd for relocation.
> =

> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> =

> ---

Applied to u-boot-stm32/master, thanks!

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

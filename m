Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2026E66C51
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:14:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C343DD3FD2E
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:14:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26E75D3FD2D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:14:18 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CC5e4l011040; Fri, 12 Jul 2019 14:14:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=esPSdPYXJhfMTxaeU8hBIaUpb/qMjsSeLnoDBlXR730=;
 b=uiJjAkD1QsNOdR8lmfGP4iPZuZa8FjKMlsu9Cn/FnQtVEYucZBj6kuDg5QKSXwWZMx+q
 BuTvacqRHfzlLCbrye0d6m+Ejd/LsBinyxPQ7gLi4ry4bHwPcyEjRzqb/1dt8Y9T5WwI
 azxFadTRGcycJG8NGOlchWNWyQKFN/pnSHJgOgRcvnAfWrZ8ibFXGFINeU15dL9ALwHA
 cgS36Vaung+Rn8lg32HIKSxvPh7MD32MVTmW4Kw1QgTml+hi93FvWuQyWRJl4XzxkDjG
 lRiTztuPMZq/zp6waHnE3UEWRUJIfKjgKkwqN0DnNnixpJofzdyX9htiyqfTw1ix37Ta 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tpj3tjvq8-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:14:17 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E244E34;
 Fri, 12 Jul 2019 12:14:16 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C06F2B63;
 Fri, 12 Jul 2019 12:14:16 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 12 Jul
 2019 14:14:16 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:14:16 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 05/16] dt-bindings: pinctrl: stm32: add new entry for
 package information
Thread-Index: AQHVM0Uw/shHnSenqk2LGbGsUwi1QabG7/Yw
Date: Fri, 12 Jul 2019 12:14:16 +0000
Message-ID: <abe75cac1ca64cb2aa5cd44a83cc0221@SFHDAG6NODE3.st.com>
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
 <1562340023-8516-6-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1562340023-8516-6-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 05/16] dt-bindings: pinctrl: stm32: add
 new entry for package information
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
> 
> Add "st,package" entry. Possibles values are:
> -STM32MP_PKG_AA for LFBGA448 (18*18) package -STM32MP_PKG_AB for
> LFBGA354 (16*16) package -STM32MP_PKG_AC for TFBGA361 (12*12)
> package -STM32MP_PKG_AD for TFBGA257 (10*10) package
> 
> see Linux commit 966d9b928f626a54a0c27c0fdae1e3dfe9bab416
> for v5.2-rc1
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v2: None
> 
>  .../pinctrl/st,stm32-pinctrl.txt                   | 101 ++++++++++++++++++---
>  include/dt-bindings/pinctrl/stm32-pinfunc.h        |   6 ++
>  2 files changed, 94 insertions(+), 13 deletions(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

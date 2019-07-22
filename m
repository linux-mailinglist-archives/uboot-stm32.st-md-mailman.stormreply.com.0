Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB776FFB7
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 14:33:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C360CD24C9
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 12:33:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD4F1CD24C8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 12:33:25 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MCQwOM020477; Mon, 22 Jul 2019 14:33:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=vwRWBTbOSaxuo9KRjK0ns9qZMKLE96dVvTZZODnVNKs=;
 b=MwWT1ctzlQkLP8giYJDuF1ESFeA2p3WxyZie6V82BrhtUHSZOp2x9YVWuwJ29vTlLn/Z
 xVNy/oe4axhfhal1jN/feLPpmEsAnCTnvcbEbgY+wOPcr4MtPxz7qOIHBI1FYlq7DfyU
 cIgS9v5ZPHZbyY9rfX3Ucnc0wjCIfu7nSc0obbeNr3BrEMek+h27EWMULuJwY76FtCOC
 oYOoTCjIFpIDVcrx+5v1FmKgdc5fjwOb5iUB+/uOMI4jAZBHNTbLIbzFwYAETVLJNZ/+
 UilQpUVJGRpSl+SqYb1G2g1BwZCMdXEwIE1DrK4DAOmhcXrcopvkxIo2l4iNd5BB2yDA Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ture1bmks-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 14:33:14 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5791F3A;
 Mon, 22 Jul 2019 12:33:06 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E19CC2CF3;
 Mon, 22 Jul 2019 12:33:05 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jul
 2019 14:33:05 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 22 Jul 2019 14:33:05 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 4/4] doc: device-tree-bindings: alignment with v5.2-rc6
 for spi-stm32-qspi.txt
Thread-Index: AQHVLbHbr8wWdZ5Q30aUCcqIJvuBMabWt7/w
Date: Mon, 22 Jul 2019 12:33:05 +0000
Message-ID: <5ad738c224144b98b252f243da37f29b@SFHDAG6NODE3.st.com>
References: <20190628130301.18094-1-patrice.chotard@st.com>
 <20190628130301.18094-5-patrice.chotard@st.com>
In-Reply-To: <20190628130301.18094-5-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_10:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Simon
 Goldschmidt <simon.k.r.goldschmidt@gmail.com>, Rick Chen <rick@andestech.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] doc: device-tree-bindings: alignment
 with v5.2-rc6 for spi-stm32-qspi.txt
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

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: vendredi 28 juin 2019 15:03
> 
> Align doc/device-tree-bindings/spi/spi-stm32-qspi.txt with kernel v5.2-rc6
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> 
> ---
> 
>  .../spi/spi-stm32-qspi.txt                    | 71 ++++++++++---------
>  1 file changed, 38 insertions(+), 33 deletions(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

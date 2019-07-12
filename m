Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43166670E1
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 16:01:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 066A5C6A5FA
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:01:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AEDBD40C19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 14:01:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CDv9jM013847; Fri, 12 Jul 2019 16:01:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=C7XL1oNICTPeZ+4HLfoJKc3gPfrV9L0gvqHdq4qSRpw=;
 b=wKFDqTX3XBPYBhJ6ibg7u1ZS8SmmtAdia0QsbMYsUYvV8dIa8qA5ck7Z3OTze+t0i2xH
 6WrkJ2I+09GIhLEzmmE8f6+1sCAfzl7sEPIiNIc4MMuBq8WFgugOtkRZQakFNIAOn7kd
 +IhHsLY+cOlpA9KWwLp7XDby2R1rCWWsptICW/rCLI98R6C1mSDeFzkBHfDhdADSGlu9
 MY8CPbr8mrqtRkATFFl5WSLrCMPG0nf0lYYhenAWW8PtJwo+FSLiut4/bw5gIYwSXxoT
 +8X9LHuEtzXQt9s+8nW2PnA0EFHCwxEIfnnembDj4WNGgoes1+Dav9hee0nnZ0TgW+US Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tjjhjadjx-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 16:01:23 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 042BE48;
 Fri, 12 Jul 2019 14:01:22 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E12264E57;
 Fri, 12 Jul 2019 14:01:22 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 12 Jul
 2019 16:01:22 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 16:01:22 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 15/20] power: stpmic1: Fix warnings when compiling with
 W=1
Thread-Index: AQHVKDUNBBV6ZVGmW0mLOlL1x1/odqbHI6pg
Date: Fri, 12 Jul 2019 14:01:22 +0000
Message-ID: <b9597d1ed83d40498525db1d5f127f6e@SFHDAG6NODE3.st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
 <1561123618-2029-15-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1561123618-2029-15-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Christophe
 KERELLO <christophe.kerello@st.com>, Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 15/20] power: stpmic1: Fix warnings when
 compiling with W=1
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
> Sent: vendredi 21 juin 2019 15:27
> 
> This patch solves the following warnings:
> warning: this statement may fall through [-Wimplicit-fallthrough=]
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/power/regulator/stpmic1.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

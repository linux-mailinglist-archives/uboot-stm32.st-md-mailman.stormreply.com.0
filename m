Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D18B175611
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 09:36:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2DB5C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 08:36:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3DF7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2020 08:36:43 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0228RdKx014509; Mon, 2 Mar 2020 09:36:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=P3vihDgOWa1/ni2WJHENKaiadPx8vKuemMXRoiqqVC8=;
 b=zeUv/VjKTulcb+/8IIUOufuwzA0qiU4q+wzqjXrVs6qy0nEyDNjEMPq6fYOeWYeiIlcs
 89VS+KsC43F/tvU9WhUhDunxcVfjLsGS4apq0SkZLzfzmnrsMwUk1CEi9as/UKh5sF2n
 XPdTlTWFGfTopdK03D+aBKp8OwWKWAO7VYt+NWkd043Ra6oqcihqkJL8nLvVVfuvmpT4
 1gzjWOnaL0lRctXO4WtYDcwPAnjq9EWXDSae6pu1vr6SgT5Xl31gYvQWo9PfWUXMQ3H6
 t/TA64HpulTxZuxFXFbKMN6Zg+CZj01AgnRrHczfXmn74zfhyc4Qr2iWDHT7SGrVx7rg 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfea6j949-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2020 09:36:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A954100038;
 Mon,  2 Mar 2020 09:36:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8E192A776F;
 Mon,  2 Mar 2020 09:36:26 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Mar
 2020 09:36:26 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 2 Mar 2020 09:36:26 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v3] doc: add board documentation for stm32mp1
Thread-Index: AQHV7AX+aBU9OqYMg0S+8PtHeafoAag1AwtQ
Date: Mon, 2 Mar 2020 08:36:26 +0000
Message-ID: <fa5fae0e62624c74a772c28612274c5e@SFHDAG6NODE3.st.com>
References: <20200225180414.9065-1-patrick.delaunay@st.com>
In-Reply-To: <20200225180414.9065-1-patrick.delaunay@st.com>
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
Cc: Lokesh
 Vutla <lokeshvutla@ti.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, "Andrew F. Davis" <afd@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [Uboot-stm32] [PATCH v3] doc: add board documentation for
	stm32mp1
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
> Sent: mardi 25 f=E9vrier 2020 19:04
> =

> Change plain test README to rst format and move this file in documentation
> directory.
> =

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> ---

Applied to u-boot-stm32/master, thanks!

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

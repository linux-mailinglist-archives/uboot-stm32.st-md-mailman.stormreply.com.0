Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD36D18043C
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 18:02:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B489C36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 17:02:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1E2BC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2020 17:02:09 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02AGiqkn012959; Tue, 10 Mar 2020 18:01:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=C9IRzp+0aJcp1Fo74aR8blE9o8HJbCH2c47frgRO3jE=;
 b=snWHrfxS+v42yaZ5qUQagHWe9KvrvwvohtWHc33YInKVFPD9BNIlIillEEdcYGBv4xO6
 nYs1R3dEZGWEwMyHLEjvJBYfAnM0WYg2HfBJnYfbX6tn/UUwfg+I/NHxSLsRCZreeb49
 X9AobNORvVuT2dJUji8QmTKSZdvJQFNq/12xxEkCduIFn3B4s/3KBIeLi2OGsVpBxRgN
 HOo5mTORbFunvHoZE3Dssyej8GhVsop156AMVqdg6vwFdxSUG4Pa/VGV+Gwkefc5WOcJ
 Xqn9eQ8zMnN4DEjhnA1Lx/CyG1E5NFD33QNwR/m0GMJXiT+YFf7+rVrerJmBteKAaT1g Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym292cvrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Mar 2020 18:01:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 397F810002A;
 Tue, 10 Mar 2020 18:01:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 08DA321BAB9;
 Tue, 10 Mar 2020 18:01:50 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 10 Mar
 2020 18:01:49 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 10 Mar 2020 18:01:49 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v6 0/5] usb: host: dwc2: use driver model for PHY and
 CLOCK
Thread-Index: AQHV9sP0L9yL6EBFTUiIs8rwgW9mm6hB4IyAgAAmmdA=
Date: Tue, 10 Mar 2020 17:01:49 +0000
Message-ID: <6e2e15a588d742a8b9367807ba01d941@SFHDAG6NODE3.st.com>
References: <20200310100912.28129-1-patrick.delaunay@st.com>
 <0679888c-4fa3-f759-6107-87eac3750755@denx.de>
In-Reply-To: <0679888c-4fa3-f759-6107-87eac3750755@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-10_11:2020-03-10,
 2020-03-10 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>,
 "simon.k.r.goldschmidt@gmail.com" <simon.k.r.goldschmidt@gmail.com>, Lukasz
 Majewski <lukma@denx.de>, "ley.foon.tan@intel.com" <ley.foon.tan@intel.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Michal Suchanek <msuchanek@suse.de>
Subject: Re: [Uboot-stm32] [PATCH v6 0/5] usb: host: dwc2: use driver model
 for PHY and CLOCK
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

Hi Marek,

> From: Marek Vasut <marex@denx.de>
> Sent: mardi 10 mars 2020 16:20
> Subject: Re: [PATCH v6 0/5] usb: host: dwc2: use driver model for PHY and
> CLOCK
> Importance: High
> 
> On 3/10/20 11:09 AM, Patrick Delaunay wrote:
> >
> > In this serie I update the DWC2 host driver to use the device tree
> > information and the associated PHY and CLOCK drivers when they are
> > availables.
> >
> > V6 is minor update of the first patch of the serie; I update some clk
> > stub to return success after Simon Goldschmidt remarks on V5:
> > http://patchwork.ozlabs.org/project/uboot/list/?series=162791
> 
> Once Simon reviews them, I'll put them in usb/next . btw I'm not CCed on 1/5,
> would be helpful if you could keep the CC consistent, thanks

Ok and thanks

I used patman for the serie with default maintainers list + 3 reviewers in Serie-CC 
    Series-cc: simon.k.r.goldschmidt@gmail.com
    Series-cc: b.galvani@gmail.com
    Series-cc: ley.foon.tan@intel.com

But I forgot you. Sorry.

Patrick
.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

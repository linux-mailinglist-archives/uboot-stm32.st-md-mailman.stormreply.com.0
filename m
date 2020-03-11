Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F53181803
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Mar 2020 13:31:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01141C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Mar 2020 12:31:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40D2DC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2020 12:31:04 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02BCDIDk015212; Wed, 11 Mar 2020 13:30:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Y44HVtcW4m01G3iIZu1UETR6KHlb4FtWz7Vy07pVcVI=;
 b=XCdEQPN8TdFZJO5KQqS21D/sBqvGVcT2G1ojLn74XbbGPq/J+zY42WXb8kaKgygGGPeL
 7upArae/asxWji6S7ATWRj55LgmjckXmbT4PhyUDw6rvEAAWcx7nUdlKWSBca3Jj2MX8
 Lysiy79dKw+W3J6ep1hAnrZhKnixBqOKixtyofdAnaExu/Fs51x/S6ZYG3daNjrV6+qU
 d5YVyzwwIqdEEBBN4Yalbv8Rso8hibK8CyZaO5xjwlaL70qOe35ExRSZ9Tg97HACnaP8
 nxor00ptSXLP/qgarJXUhE/Tq/SSipujT62Egodivmv+nAq1wE/9/EKnit2/XjlPA5QL Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym1y6trrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Mar 2020 13:30:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3EFBA10002A;
 Wed, 11 Mar 2020 13:30:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0CFC72A96FF;
 Wed, 11 Mar 2020 13:30:38 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 11 Mar
 2020 13:30:37 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 11 Mar 2020 13:30:37 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v6 0/5] usb: host: dwc2: use driver model for PHY and
 CLOCK
Thread-Index: AQHV9sP0L9yL6EBFTUiIs8rwgW9mm6hB4IyAgAAmmdCAAA2YgIABN1wQ
Date: Wed, 11 Mar 2020 12:30:37 +0000
Message-ID: <485752ee00e2480781494cedc33ec43e@SFHDAG6NODE3.st.com>
References: <20200310100912.28129-1-patrick.delaunay@st.com>
 <0679888c-4fa3-f759-6107-87eac3750755@denx.de>
 <6e2e15a588d742a8b9367807ba01d941@SFHDAG6NODE3.st.com>
 <f5bcdb37-d7ed-c190-bb21-62f8ec71b27c@denx.de>
In-Reply-To: <f5bcdb37-d7ed-c190-bb21-62f8ec71b27c@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_05:2020-03-11,
 2020-03-11 signatures=0
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
> Sent: mardi 10 mars 2020 19:27
> 
> On 3/10/20 6:01 PM, Patrick DELAUNAY wrote:
> > Hi Marek,
> >
> >> From: Marek Vasut <marex@denx.de>
> >> Sent: mardi 10 mars 2020 16:20
> >> Subject: Re: [PATCH v6 0/5] usb: host: dwc2: use driver model for PHY
> >> and CLOCK
> >> Importance: High
> >>
> >> On 3/10/20 11:09 AM, Patrick Delaunay wrote:
> >>>
> >>> In this serie I update the DWC2 host driver to use the device tree
> >>> information and the associated PHY and CLOCK drivers when they are
> >>> availables.
> >>>
> >>> V6 is minor update of the first patch of the serie; I update some
> >>> clk stub to return success after Simon Goldschmidt remarks on V5:
> >>> http://patchwork.ozlabs.org/project/uboot/list/?series=162791
> >>
> >> Once Simon reviews them, I'll put them in usb/next . btw I'm not CCed
> >> on 1/5, would be helpful if you could keep the CC consistent, thanks
> >
> > Ok and thanks
> >
> > I used patman for the serie with default maintainers list + 3 reviewers in Serie-CC
> >     Series-cc: simon.k.r.goldschmidt@gmail.com
> >     Series-cc: b.galvani@gmail.com
> >     Series-cc: ley.foon.tan@intel.com
> >
> > But I forgot you. Sorry.
> 
> I'd expect get-maintainer script should tell you to add me, maybe patman needs
> fixing.

I will try to avoid this issue for my next serie...

FYI: I check and the CC list is build with (series.py::MakeCcFile)

1/ Get maitainer script

It give me for this patch

./scripts/get_maintainer.pl 0001-dm-clk-add-stub-when-CONFIG_CLK-is-deactivated.patch 
Peng Fan <peng.fan@nxp.com> (commit_signer:7/15=47%,authored:2/15=13%)
Lukasz Majewski <lukma@denx.de> (commit_signer:6/15=40%,authored:6/15=40%,added_lines:36/255=14%,removed_lines:1/17=6%)
Jean-Jacques Hiblot <jjhiblot@ti.com> (commit_signer:3/15=20%,authored:3/15=20%,added_lines:53/255=21%,removed_lines:3/17=18%)
Simon Glass <sjg@chromium.org> (commit_signer:3/15=20%)
Lokesh Vutla <lokeshvutla@ti.com> (commit_signer:1/15=7%)
Sekhar Nori <nsekhar@ti.com> (authored:1/15=7%)
Chunfeng Yun <chunfeng.yun@mediatek.com> (authored:1/15=7%,added_lines:40/255=16%)
Patrick Delaunay <patrick.delaunay@st.com> (added_lines:89/255=35%,removed_lines:13/17=76%)
Jagan Teki <jagan@amarulasolutions.com> (added_lines:15/255=6%)
u-boot@lists.denx.de (open list)

PS: same for "./scripts/get_maintainer.pl include/clk.h"

2/ tags (based on aliases of ./doc/git-mailrc)
   "dm" and "clk:"
	=> dm = sjg
	=> clk = unknown tag

   But no tag "usb" => marex

3/ Series-cc

So I don't think it is a not patman issue
and the maintainer list is build patch by patch in the serie...

I perhaps miss something in my configuration for the 'usb' serie.
 
For patman, I use 

$> git config sendemail.to uboot
$> git config sendemail.aliasesfile doc/git-mailrc
....
$> tools/patman/patman -c 5 -t -i

Perhaps I need to use the correct alias = "usb" for USB related topic....
(for all the serie and no more rely on "tags")

$> git config sendemail.to usb

In this case I have :

To: u-boot@lists.denx.de,
	Marek Vasut <marex@denx.de>
Cc: ley.foon.tan@intel.com,
	b.galvani@gmail.com,
	simon.k.r.goldschmidt@gmail.com,
	Patrick Delaunay <patrick.delaunay@st.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Jean-Jacques Hiblot <jjhiblot@ti.com>,
	Lukasz Majewski <lukma@denx.de>,
	Peng Fan <peng.fan@nxp.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Simon Glass <sjg@chromium.org>,
	U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v6 1/5] dm: clk: add stub when CONFIG_CLK is deactivat

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

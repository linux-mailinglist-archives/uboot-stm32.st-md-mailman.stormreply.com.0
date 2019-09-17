Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39460B4CE2
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 13:28:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9145C36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 11:28:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BA97C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 11:28:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8HBRpWv018675; Tue, 17 Sep 2019 13:28:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=3dse7cSVEbrs0VAi9cZ6qNmF+7Ze8WfwJQgnYFwZ1a4=;
 b=G9OMG/TgSkmxJOev8hrgl6SUvZ5PVsr19dezy/zcPtPEPSzVk4RC5w8t/eoDBm0CATEy
 L+gb5l3Sk3ZKdTDaFA6QVi3F2wFTcJSd+7IpRbQNI/iv4l5judYp+paGXVEBqKrlmndQ
 b9BJKd77f1uUfSuM80OaffW580+raeQ1A7ZfCn+8UwC8+2AlPeh47qd4neJmT1IiSceY
 96sdxwb+Ceh7IpyrwrKM6Mv7kfC9qNlmIbhBfaB2lCfvTYbVoOGUboT+Wv6gv4hiumVt
 9sFephsiSQRXw8n2tdLUPyoJfi4f0I/bI9JGzj+UFDiDjs1h69rIJe/4zuvPdqefs4Dm sQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v0q3fry5e-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 17 Sep 2019 13:28:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4AFF54E;
 Tue, 17 Sep 2019 11:28:18 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8142F2B4CF7;
 Tue, 17 Sep 2019 13:28:17 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 17 Sep
 2019 13:28:17 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 17 Sep 2019 13:28:17 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Lukasz Majewski <lukma@denx.de>
Thread-Topic: [PATCH 04/14] dfu: allow to manage DFU on several devices
Thread-Index: AQHVaj5GYNKdtrYMI0KmYp5tmncOzKcvjnyAgAAxNLA=
Date: Tue, 17 Sep 2019 11:28:17 +0000
Message-ID: <3e59a18047fd4b349f54669a7a24f70e@SFHDAG6NODE3.st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
 <20190913141930.15784-5-patrick.delaunay@st.com>
 <20190917122539.4dd99678@jawa>
In-Reply-To: <20190917122539.4dd99678@jawa>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-17_06:2019-09-17,2019-09-17 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 04/14] dfu: allow to manage DFU on several
	devices
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

Hi Lukasz,

> From: Lukasz Majewski <lukma@denx.de>
> Sent: mardi 17 septembre 2019 12:26
> To: Patrick DELAUNAY <patrick.delaunay@st.com>
> Cc: u-boot@lists.denx.de; U-Boot STM32 <uboot-stm32@st-md-
> mailman.stormreply.com>
> Subject: Re: [PATCH 04/14] dfu: allow to manage DFU on several devices
> Importance: High
> 
> Hi Patrick,
> 
> > Add support of DFU for several interface/device with one command.
> >
> > The format for "dfu_alt_info" in this case is :
> >   interface with devstring'='alternate list (';' separated)
> >   and each interface is separated by '&'
> >
> > The previous behavior is always supported.
> >
> > One example for NOR (bootloaders) + NAND (rootfs in UBI):
> >
> > U-Boot> env set dfu_alt_info \
> > "sf 0:0:10000000:0=spl part 0 1;u-boot part 0 2; \ u-boot-env part 0
> > 3&nand 0=UBI partubi 0,3"
> >
> > U-Boot> dfu 0 list
> >
> > DFU alt settings list:
> > dev: SF alt: 0 name: spl layout: RAW_ADDR
> > dev: SF alt: 1 name: ssbl layout: RAW_ADDR
> > dev: SF alt: 2 name: u-boot-env layout: RAW_ADDR
> > dev: NAND alt: 3 name: UBI layout: RAW_ADDR
> >
> > U-Boot> dfu 0
> >
> > $> dfu-util -l
> >
> > Found DFU: [0483:5720] ver=9999, devnum=96, cfg=1,\  intf=0, alt=3,
> > name="UBI", serial="002700333338511934383330"
> > Found DFU: [0483:5720] ver=9999, devnum=96, cfg=1,\  intf=0, alt=2,
> > name="u-boot-env", serial="002700333338511934383330"
> > Found DFU: [0483:5720] ver=9999, devnum=96, cfg=1,\  intf=0, alt=1,
> > name="u-boot", serial="002700333338511934383330"
> > Found DFU: [0483:5720] ver=9999, devnum=96, cfg=1,\  intf=0, alt=0,
> > name="spl", serial="002700333338511934383330"
> >
> 
> My two remarks:
> 
> 1. As you mentioned above - the current behavior must be preserved (this is my
> main concern).

I agree, it was also my concern.

I don't indicated it clearly by I test it on my board and it but it is preserved.

For example, on my stm32mp1 board :

STM32MP> env set dfu_alt_info "sdcard_fsbl1 part 0 1;sdcard_fsbl2 part 0 2;sdcard_ssbl part 0 3;sdcard_bootfs part 0 4;sdcard_vendorfs part 0 5;sdcard_rootfs part 0 6"
STM32MP> dfu 0 mmc 0

On the host side 

dfu-util -l
dfu-util 0.9

Copyright 2005-2009 Weston Schmidt, Harald Welte and OpenMoko Inc.
Copyright 2010-2016 Tormod Volden and Stefan Schmidt
This program is Free Software and has ABSOLUTELY NO WARRANTY
Please report bugs to http://sourceforge.net/p/dfu-util/tickets/

Found DFU: [0483:df11] ver=0200, devnum=17, cfg=1, intf=0, path="3-1.3.1", alt=5, name="sdcard_rootfs", serial="002700333338511934383330"
Found DFU: [0483:df11] ver=0200, devnum=17, cfg=1, intf=0, path="3-1.3.1", alt=4, name="sdcard_vendorfs", serial="002700333338511934383330"
Found DFU: [0483:df11] ver=0200, devnum=17, cfg=1, intf=0, path="3-1.3.1", alt=3, name="sdcard_bootfs", serial="002700333338511934383330"
Found DFU: [0483:df11] ver=0200, devnum=17, cfg=1, intf=0, path="3-1.3.1", alt=2, name="sdcard_ssbl", serial="002700333338511934383330"
Found DFU: [0483:df11] ver=0200, devnum=17, cfg=1, intf=0, path="3-1.3.1", alt=1, name="sdcard_fsbl2", serial="002700333338511934383330"
Found DFU: [0483:df11] ver=0200, devnum=17, cfg=1, intf=0, path="3-1.3.1", alt=0, name="sdcard_fsbl1", serial="002700333338511934383330"


> 2. You added the example of usage to the commit message. Could you also add it
> to the ./doc/README.dfu (not yet present) file ?

Yes I willl create the file in V2

> Anyway, thanks for your work :-)
> 
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> 
> Acked-by: Lukasz Majewski <lukma@denx.de>
> 

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

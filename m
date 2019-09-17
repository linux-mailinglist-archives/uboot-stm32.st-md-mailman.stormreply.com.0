Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DA0B4D0F
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 13:40:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25B2DC36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 11:40:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FD54C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 11:40:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8HBa6Yw025315; Tue, 17 Sep 2019 13:40:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=EHWmeO8ylP/lwfnjRs0+FWfVTlRVgE0PRlt9OR2dNhk=;
 b=H7FeQwPRxiWBetKgLd/swgqi75I2QB+Al3rIjVtxciEfaAyRD+EobXDXJNBSTaPxc0n/
 2Ql8JLYisf73GvfrwhzmN0nwc4zcgBQCoBkZTCHY1zFlST0m5l0WXiA/wenLpcjPjPoC
 fDIyGfOfyR5hBfeHgE2Sg2iO4YYB3I4I4tyKUmHc+4DvsbqXkKPTOCGvUeyefuchbqhd
 zHaVL+XyQtw9+mFOAAxaZ7YjYVtas8O1p/IFRqCUOY6F3iF3V4Tqxy0+GBSx+A02ly9P
 I9wvjh6pTdXXf/Sy3nEp5bOGIBlCNiCLRFyVkdZsCL55O8AK/BZ/nxfhcyGlHcuXbzDX pw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v0q3fs145-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 17 Sep 2019 13:40:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2A69523;
 Tue, 17 Sep 2019 11:40:02 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 86B362BA16E;
 Tue, 17 Sep 2019 13:40:01 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 17 Sep
 2019 13:40:01 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 17 Sep 2019 13:40:01 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Lukasz Majewski <lukma@denx.de>
Thread-Topic: [PATCH 06/14] dfu: add backend for MTD device
Thread-Index: AQHVaj5IU7AmhuH5CUK/p32OKwZav6cvkVAAgAAwYwA=
Date: Tue, 17 Sep 2019 11:40:01 +0000
Message-ID: <06c54ee1331f462d94c601b9ce40f6e7@SFHDAG6NODE3.st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
 <20190913141930.15784-7-patrick.delaunay@st.com>
 <20190917123546.585d870a@jawa>
In-Reply-To: <20190917123546.585d870a@jawa>
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
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 06/14] dfu: add backend for MTD device
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

> From: Lukasz Majewski <lukma@denx.de>
> Sent: mardi 17 septembre 2019 12:36
> 
> Hi Patrick,
> 
> > Add DFU backend for MTD device: allow to read and write on any MTD
> > device (RAW or SPI)
> >
> > For example :
> > > set dfu_alt_info "nand_raw raw 0x0 0x100000"
> > > dfu 0 mtd nand0
> >
> > This MTD backend provides the same level than dfu nand
>                                      ^^^^^ - shouldn't there be
>                                      "functionality" or such?
> 
> > backend for NAND in RAW mode and sf backend for NOR; So it can replace
> > booth of them but it can also add support of spi-nand.
> 
> If I understood correctly - it allows reading "raw" data from MTD device - NAND,
> SPI-NOR and SPI-NAND?

Yes, "all MTD devices" :  NAND, SPI-NOR, SPI-NAND

My message wasn't clear except if you know the driver organization, I update it in V2

	drivers/mtd/raw 
	drivers/mtd/nand
	drivers/mtd/spi

and potentially also ONENAND als o (not tested) with drivers/mtd/onenand

> >
> > > set dfu_alt_info "nand_raw raw 0x0 0x100000"
> > > dfu 0 mtd spi-nand0
> >
> > The backend code is based on the MTD command introduced by commit
> > 5db66b3aee6f ("cmd: mtd:
> > add 'mtd' command")
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> 
> 
> 
> Best regards,
> 
> Lukasz Majewski
> 
> --
> 

Beast regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

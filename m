Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C194BBEE7C
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Sep 2019 11:31:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A642C36B3F
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Sep 2019 09:31:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12EC8C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2019 09:31:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8Q9VSB6010891; Thu, 26 Sep 2019 11:31:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=voHeyUOCQo7dUpzKukNcWDGbo79omfAd6idBHZtfyqo=;
 b=yAEepUhB9Xj6H3NHBw1bD56FVW08OP3gAqBI8RXxf2d+ViTpMKECIlDz+juzx647R5ao
 +f4C9ZiqPrTJ5nLJ+DJXS6h8+cZNMUTsVpzie2cq7WvxHIHeT706Fsv5JL/XjmiJmwHw
 zGxoOdRmKT2SFlnE/b3wmYK5ebBqZ6XUZiBNTenHHnuH5NPZzmjJrYKgFcikWxe1Hnlj
 wEA/rq76pqrmnxP9tdGiL5StBheRRb2c0jePVt4z6tpEXJOuOsHn8u/XEjxsLm30QktU
 pIlu/7yyZYsd/1sJb/P6a8AXMqgo7/muFTVCT0zeLmOqRlT49SdgYJ05DSgu7ZHL21C3 iw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v59mxdj9m-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 26 Sep 2019 11:31:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9FA934C;
 Thu, 26 Sep 2019 09:31:47 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A36732B5E0F;
 Thu, 26 Sep 2019 11:31:46 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 26 Sep
 2019 11:31:46 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 26 Sep 2019 11:31:46 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Stefan Roese <sr@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] cmd: mtd: solve bad block support in erase command
Thread-Index: AQHVb4PaQhRwaswpEESsidJ0/gIEzqc0KLIAgAmOt+A=
Date: Thu, 26 Sep 2019 09:31:46 +0000
Message-ID: <fa7563df3038453da3bda06da03fb51d@SFHDAG6NODE3.st.com>
References: <20190920072012.17841-1-patrick.delaunay@st.com>
 <e9bfec17-f534-ce8a-fba0-067f8a1c7131@denx.de>
In-Reply-To: <e9bfec17-f534-ce8a-fba0-067f8a1c7131@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-26_04:2019-09-25,2019-09-26 signatures=0
Cc: Christophe KERELLO <christophe.kerello@st.com>,
 Quentin Schulz <quentin.schulz@bootlin.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] cmd: mtd: solve bad block support in
	erase command
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

Hi Stefan,

> From: Stefan Roese <sr@denx.de>
> Sent: vendredi 20 septembre 2019 11:20
> 
> Hi Patrick,
> 
> On 20.09.19 09:20, Patrick Delaunay wrote:
> > This patch modify the loop in mtd erase command to erase one by one
> > the blocks in the requested area.
> >
> > It solves issue on "mtd erase" command on nand with existing bad
> > block, the command is interrupted on the first bad block with the trace:
> > 	"Skipping bad block at 0xffffffffffffffff"
> >
> > In MTD driver (nand/raw), when a bad block is present on the MTD
> > device, the erase_op.fail_addr is not updated and we have the initial
> > value MTD_FAIL_ADDR_UNKNOWN = (ULL)-1.
> 
> So here is the difference? I remember testing this on a board with SPI NAND and
> here it worked correctly. But your test case is with RAW NAND?

Yes with RAW nand.

it is the difference the U-Boot code, for SPI nan use:
	int nanddev_mtd_erase()

the fail address is always updated 
	=> einfo->fail_addr = nanddev_pos_to_offs(nand, &pos);

 
> Do you have a change to also test this on a board with SPI NAND?

I do the test  a SPI-NAND today.

The mtd erase command was functional on SPI-ANND before my patch : 
I create 2 bad block manually and they are correctly skipped.

STM32MP> mtd list  
List of MTD devices:
* spi-nand0
  - device: spi-nand@0
  - parent: qspi@58003000
  - driver: spi_nand
  - type: NAND flash
  - block size: 0x20000 bytes
  - min I/O: 0x800 bytes
  - OOB size: 128 bytes
  - OOB available: 62 bytes
  - 0x000000000000-0x000010000000 : "spi-nand0"
	  - 0x000000000000-0x000000200000 : "fsbl"
	  - 0x000000200000-0x000000400000 : "ssbl1"
	  - 0x000000400000-0x000000600000 : "ssbl2"
	  - 0x000000600000-0x000010000000 : "UBI"

STM32MP> mtd erase spi-nand0 0x00000000 0x10000000            
Erasing 0x00000000 ... 0x0fffffff (2048 eraseblock(s))
0x0fd00000: bad block
0x0fd20000: bad block
attempt to erase a bad/reserved block @fd00000
Skipping bad block at 0x0fd00000
attempt to erase a bad/reserved block @fd20000
Skipping bad block at 0x0fd20000
0x0fd00000: bad block
0x0fd20000: bad block


> Thanks,
> Stefan
> 

What it is the better solution for you ?

 update the MTD command (my patch) or allign the behavior of the 2 MTD devices 
- MTD RAW NAND (nand_base.c:: nand_erase_nand)
- MTD SPI NAND (core.c:: nanddev_mtd_erase)

Best regards 

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0A4B4D5A
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 14:04:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CBBBC36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 12:04:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20C8DC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 12:04:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8HC1bkQ027526; Tue, 17 Sep 2019 14:04:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=oQ/PqVVUMOdw8M80VgNB8553Y7f7vqG80dSDIP6ncHs=;
 b=SBFYur5gOSpeixwVvcxv7GZDDoW84yJ105GtLtbcT9fvjQ/+x+RZEkgXlS/pmNSfty8P
 gX45rCib/Lo3hJCt/dKQsfDsqgpI+AlZ7KGIiVuB+bOcl0oXv9nGY0hjdJZzKPzzpm9X
 cavgcBJ1ZpZVhQ2BikRqlqW9TZuhXd0DrL2uRBMeclO6/ZmxZyCPnAN0NEEt/JOVtopV
 mM6D8cQ9MInPtRklEXDawF9eYbu5fVB7s3g9ASYenKYl0f8MPCeBGY3I0clv6syMdbZ1
 ezcp3KBK+vYyA3DignNmrtwaWI229/a6bVj9m//4xz45n3EzIKqBpykAftJYrSWir07O Ig== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v0q3fs4xg-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 17 Sep 2019 14:04:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 48BB924;
 Tue, 17 Sep 2019 12:03:57 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D5F32BA19F;
 Tue, 17 Sep 2019 14:03:56 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Sep
 2019 14:03:56 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 17 Sep 2019 14:03:56 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Lukasz Majewski <lukma@denx.de>
Thread-Topic: [PATCH 07/14] dfu: add partition support for MTD backend
Thread-Index: AQHVaj5Ju2oStS+7AE+fZ3GiuP91p6cvkisAgAA46FA=
Date: Tue, 17 Sep 2019 12:03:56 +0000
Message-ID: <73a6a313869240a5a50d2d77d4e40108@SFHDAG6NODE3.st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
 <20190913141930.15784-8-patrick.delaunay@st.com>
 <20190917123850.16f06fd8@jawa>
In-Reply-To: <20190917123850.16f06fd8@jawa>
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
Subject: Re: [Uboot-stm32] [PATCH 07/14] dfu: add partition support for MTD
	backend
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
> Sent: mardi 17 septembre 2019 12:39
> 
> Hi Patrick,
> 
> > Add the support of MTD partition for the MTD backend.
> >
> > The expected dfu_alt_info for one alternate on the mtd device :
> > 	<name> part <part_id>
> >         <name> partubi <part_id>
> >
> > "partubi" also erase up to the end of the partition after write
> > operation.
> >
> > For example: dfu_alt_info = "spl part 1;u-boot part 2; UBI partubi 3"
> >
> > U-Boot> dfu 0 mtd nand0
> 
> The above information shall also be placed to dedicated ./doc/README.dfu file.

Yes, I will add informations in V2

> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> 
> Acked-by: Lukasz Majewski <lukma@denx.de>

Best regards,

Patrick Delaunay
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86433B4E7F
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 14:52:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BAC0C36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 12:52:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E5B8C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 12:52:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8HCkMk0015971; Tue, 17 Sep 2019 14:52:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=czzv9cH63k0hwfxiOafwdv4cQBgn/RByL9tq0lAfZ1Q=;
 b=gDJI0mpZa4vVXu3Vb350HP9B17f+zqb1p+2DY2Kl7C1pfNLVXlxRcDezgSG7XZRMYOln
 y74YfyQ+pV3Ehk4BFkq2UbwdFtWWJMfDPhXHZCLjxhAO4xycbfsZyxKNljAl9ivvB3aC
 J4FkRQ5DiWeGoEcdsBBbRe5gMP30/CM9Mqfs6dcYNyoptFNx1glsQT+Kx3xcP3bAyJun
 1/oEb4NvW6/KfMdAbww/+gQEbZIqhPrkPASJXGrP7u7qlhxjdPNh9F8am0sDpllP3KKU
 8kC6YuS6LRMlanatE9j8W4JmJvY9Zt9ngZVwOnXL778ytLu58HSBwPb2RHR68IpCGsNU /g== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v0np11ncn-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 17 Sep 2019 14:52:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C137E4E;
 Tue, 17 Sep 2019 12:52:13 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 532472BE233;
 Tue, 17 Sep 2019 14:52:13 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 17 Sep
 2019 14:52:13 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 17 Sep 2019 14:52:12 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Lukasz Majewski <lukma@denx.de>
Thread-Topic: [PATCH 09/14] dfu: add callback for flush and initiated operation
Thread-Index: AQHVaj5KNOTjZA3cFkmeBjoScs02Yacvk+AAgABEkqA=
Date: Tue, 17 Sep 2019 12:52:12 +0000
Message-ID: <e3e34b96103740d1866900db979d322a@SFHDAG6NODE3.st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
 <20190913141930.15784-10-patrick.delaunay@st.com>
 <20190917124456.7eb1be1b@jawa>
In-Reply-To: <20190917124456.7eb1be1b@jawa>
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
Subject: Re: [Uboot-stm32] [PATCH 09/14] dfu: add callback for flush and
	initiated operation
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
> Sent: mardi 17 septembre 2019 12:45
> 
> Hi Patrick,
> 
> > Add weak callback to allow board specific behavior
> > - flush
> > - initiated
> >
> > This patch prepare usage of DFU back end for communication with
> > STM32CubeProgrammer on stm32mp1 platform with stm32prog command.
> 
> As I've said previously - please add this use case and info to ./doc/README.dtu.

Yes

> 
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  drivers/dfu/dfu.c | 19 +++++++++++++++++++
> >  include/dfu.h     |  2 ++
> >  2 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c index
> > 2697235c24..f12c5afc66 100644
> > --- a/drivers/dfu/dfu.c
> > +++ b/drivers/dfu/dfu.c
> > @@ -22,6 +22,22 @@ static int dfu_alt_num;  static int alt_num_cnt;
> > static struct hash_algo *dfu_hash_algo;
> >
> > +/*
> > + * The purpose of the dfu_flush_callback() function is to
> > + * provide callback for dfu user
> > + */
> > +__weak void dfu_flush_callback(struct dfu_entity *dfu) { }
> > +
> > +/*
> > + * The purpose of the dfu_flush_callback() function is to
> > + * provide callback for dfu user
> 
> Please update this repeated comment.

Yes, in V2

> 
> > + */
> > +__weak void dfu_initiated_callback(struct dfu_entity *dfu)
> > +{
> > +}
> > +
> >  /*
> >   * The purpose of the dfu_usb_get_reset() function is to
> >   * provide information if after USB_DETACH request
> > @@ -263,6 +279,7 @@ int dfu_transaction_initiate(struct dfu_entity
> > *dfu, bool read) }
> >
> >  	dfu->inited = 1;
> > +	dfu_initiated_callback(dfu);
> >
> >  	return 0;
> >  }
> > @@ -282,6 +299,8 @@ int dfu_flush(struct dfu_entity *dfu, void *buf,
> > int size, int blk_seq_num) printf("\nDFU complete %s: 0x%08x\n",
> > dfu_hash_algo->name, dfu->crc);
> >
> > +	dfu_flush_callback(dfu);
> > +
> >  	dfu_transaction_cleanup(dfu);
> >
> >  	return ret;
> > diff --git a/include/dfu.h b/include/dfu.h
> > index 4de7d35914..5d85cc35ef 100644
> > --- a/include/dfu.h
> > +++ b/include/dfu.h
> > @@ -182,6 +182,8 @@ bool dfu_usb_get_reset(void);
> >  int dfu_read(struct dfu_entity *de, void *buf, int size, int
> > blk_seq_num); int dfu_write(struct dfu_entity *de, void *buf, int
> > size, int blk_seq_num); int dfu_flush(struct dfu_entity *de, void
> > *buf, int size, int blk_seq_num); +void dfu_flush_callback(struct
> > dfu_entity *dfu); +void dfu_initiated_callback(struct dfu_entity
> > *dfu);
> >  /*
> >   * dfu_defer_flush - pointer to store dfu_entity for deferred
> > flashing.
> 
> 
> 
> Best regards,
> 
> Lukasz Majewski
> 
> --

Best regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56163D3A85
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2019 10:06:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F266C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2019 08:06:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D848C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 08:05:59 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9B8501O031340; Fri, 11 Oct 2019 10:05:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=z73FNqH4kYOE+ecK19cbOgXL90xSSZ/pZg88zEuC9oQ=;
 b=CopOAt2U3V9h3TPxT7sqzUvfa7MiC8CS7V7OP6s6G1+Ah6pUOle/VwRf3exxjx9GK/YZ
 8NyDdlfCGEMhb2dGKMerHHEG1WhP4PVjj7/eTFv0gBYzUVso8wkJhS0IPf9RbB/Sy8Vf
 0Pwpmw9XunWbYYoBseIXsL0o8j5OtKIscjhAiXTkdvaYDj48EPt/2+b3XFFz23CTmpuP
 LE/IEJloqI8M2KkAbrtLPnEdHyUe3VHqB3GZZKZ+HIWfdCqquAJxxJRl7km08j+WU4QH
 SAqznP1So5bLoB3K3zxQO1ehpnOxHCw6H2B0R7ideYnLWF9tpbwxfYPc1h6uYFb73Vu8 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vegahh4vd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2019 10:05:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B8ECD10002A;
 Fri, 11 Oct 2019 10:05:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 82D822AD73B;
 Fri, 11 Oct 2019 10:05:55 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Oct
 2019 10:05:54 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 11 Oct 2019 10:05:55 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Lukasz Majewski <lukma@denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v2 03/16] dfu: sf: add partition support
 for nor backend
Thread-Index: AQHVf1MYZrU2XVXNK0C7b5u9hivLcadVFd0Q
Date: Fri, 11 Oct 2019 08:05:55 +0000
Message-ID: <8eb94940f4f14addaed69d5e71732dc8@SFHDAG6NODE3.st.com>
References: <20190930133832.11992-1-patrick.delaunay@st.com>
 <20190930133832.11992-4-patrick.delaunay@st.com>
 <20191010121125.1fab75d4@jawa>
In-Reply-To: <20191010121125.1fab75d4@jawa>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_05:2019-10-10,2019-10-11 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v2 03/16] dfu: sf: add partition
 support	for nor backend
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

> Sent: jeudi 10 octobre 2019 12:11
> To: Patrick DELAUNAY <patrick.delaunay@st.com>
> 
> Hi Patrick,
> 
> > Copy the partition support from NAND backend to SF, support part and
> > partubi option.
> > In case of ubi partition, erase the rest of the partition as it is
> > mandatory for UBI.
> >
> > for example:
> >
> > U-Boot> env set dfu_alt_info "spl part 0 1;\
> > u-boot part 0 2;u-boot-env part 0 3;UBI partubi 0 4"
> > U-Boot> dfu 0 sf 0:0:10000000:0
> >
> > Acked-by: Lukasz Majewski <lukma@denx.de>
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> > Changes in v2:
> > - Update dfu documentation for callbacks
> >

<snip>

> 
> This patch causes a build break on e.g. mx6sabreauto
> 
> drivers/built-in.o: In function `dfu_fill_entity_sf':
> build/../drivers/dfu/dfu_sf.c:176: undefined reference to `mtdparts_init'
> build/../drivers/dfu/dfu_sf.c:178: undefined reference to `find_dev_and_part'
> 
> To reproduce:
> ./tools/buildman/buildman.py --branch=HEAD mx6sabreauto --show_errors --
> force-build --count=22 --output-dir=../BUILD/
> 
> Branch:
> github-lmajewski-dfu/testing
> https://github.com/lmajewski/u-boot-dfu/commits/testing
> 
> Corresponding output from travis-ci:
> https://travis-ci.org/lmajewski/u-boot-dfu/builds/595994620
> 
> 
> (Please inspect all failed builds and resend v3)

I am working to solve it, v3 will occur sooen.

> > +		if (ret != 0) {
> > +			printf("Could not locate '%s'\n", mtd_id);
> > +			return -1;
> > +		}
> > +		dfu->data.sf.start = pi->offset;
> > +		dfu->data.sf.size = pi->size;
> > +		if (!strcmp(st, "partubi"))
> > +			dfu->data.sf.ubi = 1;
> >  	} else {
> >  		printf("%s: Memory layout (%s) not supported!\n", __func__, st);
> > spi_flash_free(dfu->data.sf.dev); diff --git a/include/dfu.h
> > b/include/dfu.h index 145a1576a3..bf51ab74a5 100644
> > --- a/include/dfu.h
> > +++ b/include/dfu.h
> > @@ -77,6 +77,8 @@ struct sf_internal_data {
> >  	/* RAW programming */
> >  	u64 start;
> >  	u64 size;
> > +	/* for sf/ubi use */
> > +	unsigned int ubi;
> >  };
> >
> >  #define DFU_NAME_SIZE			32
> 
> 
> 
> 
> Best regards,
> 
> Lukasz Majewski
> 
> --

Regard

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

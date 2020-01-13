Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B2D138CC4
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 09:24:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EA1BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 08:24:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F690C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 08:24:44 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00D8MoMV012263; Mon, 13 Jan 2020 09:24:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=MplI/YMbgnrJ1GWg0ZCk9BwGpd3oj6zPI+ItqbYcVfI=;
 b=egnlxIHBzDTcUPj6n78kAnxM+1M9Mpvo6sVlZw2qbWAXITyZ6eE4X7vmCejD/IL3x7lO
 6/uV2lYI4Hop9Yfezk0ABcd034y3ufMdl5RdlzTjc+xFKU7fIGytDjXLNwT7d/gkLAMG
 lI4GWpWUhRtORSby/DVTXsUqOxzpQN1cPPun2KX5pD4MhHs936YCcHO/fTWRzrgKsjf4
 iNFI3ss7LTrnBe9RU4d2umXZdV21z+GFK6UuwZR8GiDiKM5fD1Kx2DpomhU9AITdRZnT
 8b/zYJICC14Yuano6PP0zNxFD5wHOIPawjeA+ipMV9N5dny5KuBCyJTtg4vFQtwcCYXy UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf77aq41r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 09:24:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D98CC100034;
 Mon, 13 Jan 2020 09:24:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD05F2A4D94;
 Mon, 13 Jan 2020 09:24:35 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 13 Jan
 2020 09:24:35 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 13 Jan 2020 09:24:35 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Anatolij Gustschin <agust@denx.de>
Thread-Topic: [PATCH] tools: ftdgrep: correct the find regions loop in
 do_fdtgrep
Thread-Index: AQHVx4qj3lr9y0P1xUqy29HzJ0eoY6fnY2KAgADi6XA=
Date: Mon, 13 Jan 2020 08:24:35 +0000
Message-ID: <f9603b74a5744c498d323a2d2676ffcd@SFHDAG6NODE3.st.com>
References: <20200110085027.1.I4a80e4d2935f07164868f198fe868a0999be777e@changeid>
 <20200112205101.669fe9d3@crub>
In-Reply-To: <20200112205101.669fe9d3@crub>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] tools: ftdgrep: correct the find regions
 loop in do_fdtgrep
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

> From: Anatolij Gustschin <agust@denx.de>
> Sent: dimanche 12 janvier 2020 20:51
> 
> Hi Patrick,
> 
> On Fri, 10 Jan 2020 08:50:31 +0100
> Patrick Delaunay patrick.delaunay@st.com wrote:
> ...
> > diff --git a/tools/fdtgrep.c b/tools/fdtgrep.c index
> > 8f44f599c1..bcf06b871d 100644
> > --- a/tools/fdtgrep.c
> > +++ b/tools/fdtgrep.c
> > @@ -823,8 +823,10 @@ static int do_fdtgrep(struct display_info *disp, const
> char *filename)
> >  		}
> >  		if (count <= max_regions)
> >  			break;
> > +	}
> > +	if (count > max_regions) {
> >  		free(region);
> 
> This change moved free(region) out of the loop. If you do so, then please also
> change malloc() in the loop to realloc():
> 
> 	region = realloc(region, count * sizeof(struct fdt_region));

Yes, I will push V2 with realloc to avoid the memory leak that I introduced..

Thanks for review 

> --
> Anatolij

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

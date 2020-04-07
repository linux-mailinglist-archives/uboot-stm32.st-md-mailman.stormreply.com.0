Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 519E31A0F68
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Apr 2020 16:37:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0794BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Apr 2020 14:37:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9E5FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 14:37:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 037EXmRc020456; Tue, 7 Apr 2020 16:37:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=yFjMxLWGei+SBVJZTTWWXcQF4ChZEl86PFx78u195zs=;
 b=yc5KQi1fpMumYWOpTzuMVpGebNtD166kasqLR2xPj4jC/m4knY3htv2tfLPCqOsCSk0/
 5qdUt9Chcm0kWUijPvbrkKDTQ1/Rq8K96+qr+idXRERbdBJldogDw7tyvdQgbxzHvVyc
 98VrsbvRj3Z+GbrOm1GQG1MlvILzses0+H2acbkAXXM4woefkM9HxSqJ+91WyVXGvlZt
 oXVUbZkqLST+Ag6cGDaxcp45Fo2sHITy87p71CbJH7m4LQIHdwYlnp4cHjMCP6S41+gJ
 HRm8od3+3uUCN+FKss2co6K7bYo7PSj08aZO5yFUfxSbZtwakSzKsyfIgveh/8PdVPZF Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 306h4k0cqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 16:37:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3C0E0100034;
 Tue,  7 Apr 2020 16:37:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 304D52B3A4A;
 Tue,  7 Apr 2020 16:37:47 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Apr
 2020 16:37:46 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 7 Apr 2020 16:37:46 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 04/16] arm: stm32mp: detect U-Boot version used to save
 environment
Thread-Index: AQHWB3YfT7SwvWO1Jk6hh3Y/j8Awdahjv0EAgAoE72A=
Date: Tue, 7 Apr 2020 14:37:46 +0000
Message-ID: <dfda0b80538d4fcc8a038281f8e6a5c7@SFHDAG6NODE3.st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331160456.26254-1-patrick.delaunay@st.com>
 <29239ba7-0ca1-c325-9715-57ab2a548e12@st.com>
In-Reply-To: <29239ba7-0ca1-c325-9715-57ab2a548e12@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_07:2020-04-07,
 2020-04-07 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 04/16] arm: stm32mp: detect U-Boot version
 used to save environment
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

Hi Patrice

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: mercredi 1 avril 2020 09:34
> 
> Hi Patrick
> 
> On 3/31/20 6:04 PM, Patrick Delaunay wrote:
> > Imply CONFIG_VERSION_VARIABLE for stm32mp1 target and test U-Boot
> > version ($env_ver) when the environment was saved for the last time
> > and to display warning trace.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---

[....]

> > diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> > index 42717c167e..ae060fbc4b 100644
> > --- a/include/configs/stm32mp1.h
> > +++ b/include/configs/stm32mp1.h
> > @@ -222,9 +222,14 @@
> >  	"splashimage=0xc4300000\0"  \
> >  	"ramdisk_addr_r=0xc4400000\0" \
> >  	"altbootcmd=run bootcmd\0" \
> > -	"env_default=1\0" \
> > -	"env_check=if test $env_default -eq 1;"\
> > -		" then env set env_default 0;env save;fi\0" \
> > +	"env_check=" \
> > +		"env exists env_ver || env set env_ver ${ver};" \
> > +		"if env info -p -d -q; then env save; fi;" \
> 
> Is option "-q" exist ? i can't find anything about it into source code
> 
> 

Introduced in 
[v3,1/7] cmd: env: add option for quiet output on env info

http://patchwork.ozlabs.org/patch/1236816/

I forget to indicate dependency.

PAtrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

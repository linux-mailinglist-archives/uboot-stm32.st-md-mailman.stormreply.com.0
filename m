Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB12295648
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 Oct 2020 04:11:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4471C3FAE0;
	Thu, 22 Oct 2020 02:11:02 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDCC5C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Oct 2020 02:11:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gq6k0/74gNDKRPvsPEviZKaKWxjrGO0YoruwZ4FR3FnkXGLP/MLl4AHl0D33++VrvZUpGBtd/Ca5gM8qufzxwWWW6ds2Py3dIRRZ9TsimsY6MLhptO48QDPYuFAloyMcVooySMoh6ffmhBZlius78apMiA7mnrk4YxEN3j2akvgfHu3/Df69llriXGgYCpItW4bMyHk0rUFvzetFqiyssHkGzCXhHhIlQ1hizateTB11LpKoli4ZfFZHnpBgeCXahd/MZ8W3cb1aexrTX09dneDAQMGOjGr8VvxcCfji0kygyGnaOq9NbvzC2De2FoPDT/nsWbuW5kS99sGIER5o3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvs2ZLofreNNY7lwihHp/kvx3SE2PQIJ5n7FJgVbc6U=;
 b=VVbY4NnTyDxqwm/g0a2s5vhxVpOvCqBUXPFdJdUfxiXRjg25Swvxpd0hPGhy+EV/T4BaoCtMv0ohL7OHgOCHxYLDolVRTnc8Xfbwb3t0aJawLq5FYRXZnFQXII8q2E+tJZ+GkiLpuj3FFDUj51Zkr++Davn4Z+QzGP5nJEnV/WNLspg/ye4s3o8dL8AYb7rR2LJQ/ZP+umbxC24RHSv38E13/CQTIGEEKxSLhhyze05C2zW7aURgVQJrijLpEBzy0vLBKwuCXvE4DAIZ9cq7dzVRVf5OKREeA7x+GV/3lb48cfaoiaSnDRx0mFfJkaEqtv9rQKjb9Hr11SKbwAofwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvs2ZLofreNNY7lwihHp/kvx3SE2PQIJ5n7FJgVbc6U=;
 b=kYuqTLhgubAsbJtnbBDbJwrr9hL+fSl3W9K8dhuXCH0v39oZxUGfjNZShHU4rHMISqP0CaDPG22zsT7/gePclY3bKJdVL+CbK1T0jFIwCZoiwtZBQaMg1JsqTExFh+uf5wyffi40WSoYljsbIOE2a84nlcvJtVwjlUr1qR9Ptms=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB6027.eurprd04.prod.outlook.com (2603:10a6:10:c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 22 Oct
 2020 02:11:00 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef%8]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 02:11:00 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Thread-Topic: [PATCH 1/2] mmc: mmc_of_parse: Enable 52 MHz support with
 "cap-mmc-highspeed"
Thread-Index: AQHWi5mso/mj042vrEOQP0DnVmQ3J6mEIkKAgAA9A4CAHrqEsA==
Date: Thu, 22 Oct 2020 02:11:00 +0000
Message-ID: <DB6PR0402MB2760D490331883C4BC2CD6B0881D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200909215402.366561-1-mr.nuke.me@gmail.com>
 <20200915195147.2659607-1-mr.nuke.me@gmail.com>
 <ba02620d889647dfbc2c01f3c281f5a9@SFHDAG6NODE3.st.com>
 <7fa74725c9c44853895730888635d898@SFHDAG6NODE3.st.com>
In-Reply-To: <7fa74725c9c44853895730888635d898@SFHDAG6NODE3.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 44c5983f-997e-483c-e6f6-08d8762fb867
x-ms-traffictypediagnostic: DBBPR04MB6027:
x-microsoft-antispam-prvs: <DBBPR04MB6027BCD6E6E709F83DE8E515881D0@DBBPR04MB6027.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Td+kXUuUynNOT8mcGmwO20Zo4J9XIKcU9OoBZiGl3dYCPjnJw+hP2xJ+NIVoT4eQx7SJKlzOOoFT6ohqJ4T3Cpl3sUpn1oKiB23Oqpr7e43ueHa6VTV9nUsDvJPr/iaD37jyGCVSdlwzpzMchoIjYRC5jKzZrQ0YamDuwsmRcQoA8qdwEOkXDgzpqCYfeTH+F7SfwzFPfZnoh4zOdkmL9CtEyvxusNxc5jtWjbghnCBAHh2S2ldhStxtv7KHsC94aRZxKLMv/xE92Tfehiskg5sPZxl09vIFnmHT1ywqv7IQ61SY4ZkCqvFNzBUhfqq0kJlCcHAB8AQLwW2zQL4ythHd3X8h4evi8XESX3lExPHVIOqHoV+bmf4NMU4bhkDObWRiyrmUI1Wc1BM0JjaR1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(66446008)(2906002)(316002)(86362001)(54906003)(55016002)(64756008)(966005)(6916009)(52536014)(66476007)(8936002)(44832011)(66556008)(66946007)(8676002)(76116006)(26005)(33656002)(4326008)(83380400001)(5660300002)(45080400002)(7696005)(9686003)(6506007)(186003)(478600001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: S635WXc4wG7NHPl5Wh0D6I9umNqS3hmYTfz57V+SLc4OkcAc7HCgry2mWhkHiDf95onIutEYhqtfYeTr9gROXnHmIQrvKt1KqsPxtmoFnEKDoBj+o4As9u6ZpaMsVWDCEvXl6qf1iitNYUiYDKTGX2HqbYIUDcPJIc/eUExdnhEqyhoZ/MG34HsFJ8JhkmfdrOAeajDkGVPVCO4vZZZod+GISko+70vNqydJzOcoJhra2S92b8zaW5akqv007uXnhrmE8ULBe6tl+tEfK3dozqIp1quUYyTW+FlpWVw/Wguro81vJnyknC08C7a9snSRePT9uNLsiTfeMvmM2Ds8UgTH0OcofquNP1xP11puZZXNeoni0iuW8eeUrA94oEElhjJrVsjQfg1BU/cBNr05DsJwcHdwqlNqm5S0ihNff8djF7K8RHY00pWeIR36omId5IIJk95S2rdMewtPRrtTJyl0Jv4iOMWjpnB8Kph/Jmkxtl6t25LriO1ghlso5otCe9A5pV17d97dTGJMqDWLsGStK9RLp/LP6eYjmlhJGd8fEU8LL7xMu9krzJHF5ryzbHwdccos6h80fN8YNn6CWIjAf8DYfWP5amT1kV3Rn3rR1yfx8ijobRKvS8l0CxS2OaRbWOd4tSe10s/bIPEDag==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c5983f-997e-483c-e6f6-08d8762fb867
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2020 02:11:00.1583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RlQJrBbpUVq2uRxwQCXCenDnMxMUS0jhhIn/IeIGu8SBxOV92W85mmTBbx3gajRwnYW7DNYRbOVi34maVtlZJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6027
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] mmc: mmc_of_parse: Enable 52 MHz
 support with "cap-mmc-highspeed"
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

> Subject: RE: [PATCH 1/2] mmc: mmc_of_parse: Enable 52 MHz support with
> "cap-mmc-highspeed"
> 
> Hi Peng,
> 
> > From: Uboot-stm32
> <uboot-stm32-bounces@st-md-mailman.stormreply.com>
> > On Behalf Of Patrick DELAUNAY
> >
> > Hi,
> >
> > > From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > > Sent: mardi 15 septembre 2020 21:52
> > >
> > > "cap-mmc-highspeed" enables support for 26 MHz MMC, but there is no
> > > additional flag to enable 52 MHz MMC. In Linux. "cap-mmc-highspeed"
> > > is used for MMC HS at both 26MHz and 52MHz.
> > >
> > > Use the same approach and enable MMC_CAP(MMC_HS_52) host
> capability
> > > when "cap-mmc-highspeed" is found in the devicetree. In the event an
> > > MMC card doesn't support 52 MHz, it will be clocked at a speed based
> > > on its EXT CSD, even on 52 MHz host controllers
> > >
> > > Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > > ---
> > >  drivers/mmc/mmc-uclass.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> >
> > Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
> > Tested-by: Patrick Delaunay <patrick.delaunay@st.com>
> >
> > Tested on STM32MP157C-EV1, for mmc 1 = emmc with patch [1]
> >
> > 	Mode: MMC High Speed (52MHz)
> >
> > [1]: mmc: stm32_sdmmc2: Use mmc_of_parse() to read host capabilities
> >
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fpatch
> >
> work.ozlabs.org%2Fproject%2Fuboot%2Fpatch%2F20200909215402.366561-
> 1-&a
> >
> mp;data=02%7C01%7Cpeng.fan%40nxp.com%7C2242885f15fb4bc5a38508d
> 866d261c
> >
> e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63737240105383
> 8309&amp;
> >
> sdata=NJ1fDTquBTBOQVMdxYf3gTExxkNEHeZ9mnazXAKY0GQ%3D&amp;rese
> rved=0
> > mr.nuke.me@gmail.com/
> 
> Today this patch is delegate to me in patchwork even it is a mmc core patch:
> 
> https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fpatchw
> ork.ozlabs.org%2Fproject%2Fuboot%2Flist%2F%3Fseries%3D201912&amp;da
> ta=02%7C01%7Cpeng.fan%40nxp.com%7C2242885f15fb4bc5a38508d866d2
> 61ce%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63737240105
> 3848304&amp;sdata=J4b9Dy%2FnujRrpiYtaQbIq68w%2F2FfKlKoMheH8Mtae
> P8%3D&amp;reserved=0
> 
> You are OK if I integrate this patch in my stm32 pull request for v2020.01-rc1
> or I delegate to you ?

You could take that first. My PR will be later.

Thanks,
Peng.

> 
> >
> > Thanks
> >
> > Patrick
> > _______________________________________________
> > Uboot-stm32 mailing list
> > Uboot-stm32@st-md-mailman.stormreply.com
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fst-m
> >
> d-mailman.stormreply.com%2Fmailman%2Flistinfo%2Fuboot-stm32&amp;dat
> a=0
> >
> 2%7C01%7Cpeng.fan%40nxp.com%7C2242885f15fb4bc5a38508d866d261ce
> %7C686ea
> >
> 1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637372401053848304&amp;
> sdata=DDw
> >
> sEwf%2F%2B3JOeITkO2pnUjJFu4hpru5DqY5FUGNnXdM%3D&amp;reserved=
> 0
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF831B2519
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 13:31:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 324B1C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 11:31:38 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BFD5C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 10:35:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEyQV71ErJdnQgApYFr6CeJ+teW0a7M6h1fuNL3cEVpieRJWONRhaqHBHwsTRNG4f1HUT/clopNJJ8qXDfah4qRS3Fvs2DwZyzy13yPcwn7ZYxA3ieNGIvRMVZxHwLjSS2YRzR9awqDbV3Uy6KH/dtoANnxs9uKjbxUoP4GM5LSyn/wAqo9MTlRC3uWotfEO6U8tvvJLHvrXNKSZiJ8MxG5P+a8LYcZgbfJrXDTu/aE4qHqfyloWtEIRFLaBVnqLtMBksPZrZ3shBJCrM0vUntVfFY5HaG5HsEcmT0xjeTjzZDEziqYeoVt83vBz+kF3cCVNq76KFe4rK/75xHg+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOBvbVDUQGplw8zaj1+KllnE9G6onpvIfdeHbzcnSWA=;
 b=RccMSM/sL3ntjjTMMSkLCeNK1xRis2XIvbnSJuYqZr0AbjDi6CQLNG8VxoVoG+2FUSbDpeBz2gXCa0WnsCt2dLcIpNhYDQ5N92vbjbhzcgDLmAD4w0MhHbUzIasAnlUaWlWiyuOY985Vske5gbVvkkmqhI8K8ViJOAKO4P1r7Laiot2ve+jsKmY7Hfs123UaiKX4iKtIO43eQ/1zFUcRNwGhg38kuvdEBTQvrnWGML/I5y9h3n0i31gx/BV1PBo+yFMk1L/qgcCblTzG8YDZ0wYgTiREsumblI1I0Um+G21UjE2ogd/kJ7m5IXB19gIfI0nkCYGcg3ECmyYw8j9ZQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOBvbVDUQGplw8zaj1+KllnE9G6onpvIfdeHbzcnSWA=;
 b=KDXQ3E7vwwlUlDwCMOrkmkd3BuIyaV5KuvlUc1oIpJ1AQzYFmpd8UOE7TKEc9JQA4obLGSaRhK27/aHZXLk/WMmjZtLFB5GSI8/+O0m3W/Zbg6I6BZRa7Nc/kL+CHNEz+EVfee5Q7RDMV2ca/3kRdt4qJ/lLYYStvNLax6RS80s=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2727.eurprd04.prod.outlook.com (2603:10a6:4:98::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 10:35:40 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871%6]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 10:35:40 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Tom
 Rini <trini@konsulko.com>
Thread-Topic: [Uboot-stm32] [PATCH 1/3] env: mmc: allow support of
 mmc_get_env_dev with OF_CONTROL
Thread-Index: AQHV/dUzj2gIXrs6OEqTw7j0uG34GKiDg1iAgAAQpfA=
Date: Tue, 21 Apr 2020 10:35:40 +0000
Message-ID: <DB6PR0402MB2760B504CC3F094DA95AC8E088D50@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200319105917.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
 <d73f5820-92a8-b182-fca3-f8ca2fe49a01@st.com>
In-Reply-To: <d73f5820-92a8-b182-fca3-f8ca2fe49a01@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e68b932a-3052-40ab-a14b-08d7e5dfbcfe
x-ms-traffictypediagnostic: DB6PR0402MB2727:
x-microsoft-antispam-prvs: <DB6PR0402MB2727E7208A6CE9A6666DAFDD88D50@DB6PR0402MB2727.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(66556008)(26005)(81156014)(9686003)(66446008)(64756008)(76116006)(7696005)(66946007)(8936002)(4326008)(186003)(8676002)(71200400001)(52536014)(44832011)(110136005)(33656002)(478600001)(86362001)(5660300002)(66476007)(2906002)(6506007)(53546011)(55016002)(316002)(54906003);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7oQ7M0rm+bnKUe1exhszkzjzBy+biQ3Z6kDSObkYFHDPIFA8vm/gkOYcSrKuWxpbk5LkSBO89yVhrhbNFNw0RClBK1gSkG8ZAJkjnSKuouyemfS1Ahm5pACb84UINTRvqCaGHg6AoVL8g1xink2tHXbmAhe02gU1+Fts397fqaEurV2Oqtynwk7VmiDbfW488FipzSWH1PfgdPt2d2wm2XXmLH+KutzfCZSI2Cq8wOSRFhXTz2vKn0KpZZy7qOQRR0WdVMVSEIjrE6yjefnaaYID63wj8D5iDLzgU3NqGQLPq0747gC1p5he4zc5fwQryjks4eAojnswD4WcpWLJUiVindItQ7R9N1EINs71Ff0jPOlea8jBvNSXmq+z4EQFvjg9hhqhAZMU+wz675tbY4/SUsXKzcCvAPKJIQ33cmU7loGqEkGyLJscilCwu12i
x-ms-exchange-antispam-messagedata: mumVR9uOKdPSM2ny2g08yiQL6GmltZcDNbgWKrP0cANOyZVCBp4AfO7+JH5wZOFLjRRvZonbHLCUZ9SGn5B1ygvBEQMItC8eqb873aQodNfIG2xvYMvxXkQCcoeRrbGi4kW4xYG5jFv65UGS2HQYcQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68b932a-3052-40ab-a14b-08d7e5dfbcfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 10:35:40.6146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ThhqSDYxqCrRKmV/qV+DnV9KvElzBH4fth+Ym+rCfADh0iYAPdt/eeAGFd8PMSH7yrDGpcNfiO/gRK9ujNIiUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2727
X-Mailman-Approved-At: Tue, 21 Apr 2020 11:31:37 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/3] env: mmc: allow support of
 mmc_get_env_dev with OF_CONTROL
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

> Subject: Re: [Uboot-stm32] [PATCH 1/3] env: mmc: allow support of
> mmc_get_env_dev with OF_CONTROL
> 
> Hi Tom
> 
> I just noticed that this env series is delegated to Peng Fan (mmc maintainer)
> instead of Joe Hershberger (env maintainer).
> 
> Is there any reason for this or perhaps is it just an error ?

Ah, I not notice the delegation issue. if you are concerned about this. 
I'll leave this to Joe and drop the patchset from my CI.

Thanks,
Peng.

> 
> Thanks
> 
> Patrice
> 
> On 3/19/20 10:59 AM, Patrick Delaunay wrote:
> > Use the weak function mmc_get_env_dev in mmc_offset_try_partition
> > function to allow dynamic selection of mmc device to use and no more
> > use directly the define CONFIG_SYS_MMC_ENV_DEV.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  env/mmc.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/env/mmc.c b/env/mmc.c
> > index 251ad07d7c..902cca23ad 100644
> > --- a/env/mmc.c
> > +++ b/env/mmc.c
> > @@ -24,14 +24,25 @@
> >
> >  DECLARE_GLOBAL_DATA_PTR;
> >
> > +#if !defined(CONFIG_SYS_MMC_ENV_DEV)
> > +#define CONFIG_SYS_MMC_ENV_DEV 0
> > +#endif
> > +
> > +__weak int mmc_get_env_dev(void)
> > +{
> > +	return CONFIG_SYS_MMC_ENV_DEV;
> > +}
> > +
> >  #if CONFIG_IS_ENABLED(OF_CONTROL)
> >  static inline int mmc_offset_try_partition(const char *str, s64 *val)
> > {
> >  	disk_partition_t info;
> >  	struct blk_desc *desc;
> >  	int len, i, ret;
> > +	char dev_str[4];
> >
> > -	ret = blk_get_device_by_str("mmc", STR(CONFIG_SYS_MMC_ENV_DEV),
> &desc);
> > +	snprintf(dev_str, sizeof(dev_str), "%d", mmc_get_env_dev());
> > +	ret = blk_get_device_by_str("mmc", dev_str, &desc);
> >  	if (ret < 0)
> >  		return (ret);
> >
> > @@ -114,11 +125,6 @@ __weak int mmc_get_env_addr(struct mmc
> *mmc, int copy, u32 *env_addr)
> >  	return 0;
> >  }
> >
> > -__weak int mmc_get_env_dev(void)
> > -{
> > -	return CONFIG_SYS_MMC_ENV_DEV;
> > -}
> > -
> >  #ifdef CONFIG_SYS_MMC_ENV_PART
> >  __weak uint mmc_get_env_part(struct mmc *mmc){
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

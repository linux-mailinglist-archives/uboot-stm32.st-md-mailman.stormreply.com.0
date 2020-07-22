Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AE522C250
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jul 2020 11:32:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E38BC36B25
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jul 2020 09:32:25 +0000 (UTC)
Received: from vic-MTAout5.csiro.au (vic-mtaout5.csiro.au [150.229.64.42])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 229A2C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jul 2020 23:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=data61.csiro.au; i=@data61.csiro.au; q=dns/txt;
 s=dkim; t=1595458972; x=1626994972;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=esWZv3sb2dHOjhRn6qApfceKU4Vbb6MoZP4SxvmEogI=;
 b=ERGbPxvDLwhvd77Jnl9TDZ9tAVmm4bWH4uPuTThNgYVY2ThgsrYlL413
 w00wM6aWOL/pz739R/qGpIwylD11GjsTVa8FYiBlqbRWdCyTMF+zgBZ7L
 VNAlUCzl6A0Nd4haf5P4RY6INEaqAkG6+7UMwUF1cEPGs7WaqofjUa1av U=;
IronPort-SDR: E3TLUzwCNZrJ7crJCOvDdpXqijx4Y1aFv4t7b/ChGh7UfGFt3b1+VUKgmpofNEGVusqKtbuFZd
 tUA4cYn1mLWw==
X-SBRS: 4.0
IronPort-PHdr: =?us-ascii?q?9a23=3A9I54/BCMRMVrIBj+ZRIfUyQJPHJ1sqjoPgMT9p?=
 =?us-ascii?q?ssgq5PdaLm5Zn5IUjD/qw00A3SQcPQ7PcXw+bVsqW1X2sG7N7BtX0Za5VDWl?=
 =?us-ascii?q?cDjtlehA0vBsOJSCiZZP7nZiA3BoJOAVli+XzoKlQTE8H7NBXep3So5msUHR?=
 =?us-ascii?q?PyfQN+OuXyHNvUiMK6n+C/8pHeeUNGnj24NL97MBzo9EParcgMhs1rN/U8?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A+GpAABSxBhfjACwBSSwhIATAJKcgDN?=
 =?us-ascii?q?gGwEBAQEBAQEBBQEBARIBAQEDAwEBAUCBSoFSUWKBRwqHbwOiLYZTA1ULAQE?=
 =?us-ascii?q?BDi0CBAEBAoRKAoIPAiQ4EwIDAQELAQEGAQEBAQEGBAICEAEBASaGDAyDU4E?=
 =?us-ascii?q?DAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBBQKBDD4CAQM?=
 =?us-ascii?q?SKAYBATcBDwIBCDYQECIlAgQOBSKDBIJMAy0BAQSifgKBOYhgAQFzgTSDAQE?=
 =?us-ascii?q?BBYUzGIIOCQkBgS4BgmmKCIIagUeCJTU+hD2FVCKSHQGjNAcBAoJdmWYhgmm?=
 =?us-ascii?q?caC2wYAIEAgQFAg4BAQWBaoF7HU+DPVAXAg2OHhqDV4pWdAI1AgYIAQEDCXy?=
 =?us-ascii?q?OGQGBEAEB?=
X-IPAS-Result: =?us-ascii?q?A+GpAABSxBhfjACwBSSwhIATAJKcgDNgGwEBAQEBAQEBB?=
 =?us-ascii?q?QEBARIBAQEDAwEBAUCBSoFSUWKBRwqHbwOiLYZTA1ULAQEBDi0CBAEBAoRKA?=
 =?us-ascii?q?oIPAiQ4EwIDAQELAQEGAQEBAQEGBAICEAEBASaGDAyDU4EDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBBQKBDD4CAQMSKAYBATcBDwIBC?=
 =?us-ascii?q?DYQECIlAgQOBSKDBIJMAy0BAQSifgKBOYhgAQFzgTSDAQEBBYUzGIIOCQkBg?=
 =?us-ascii?q?S4BgmmKCIIagUeCJTU+hD2FVCKSHQGjNAcBAoJdmWYhgmmcaC2wYAIEAgQFA?=
 =?us-ascii?q?g4BAQWBaoF7HU+DPVAXAg2OHhqDV4pWdAI1AgYIAQEDCXyOGQGBEAEB?=
Received: from exch3-cdc.nexus.csiro.au ([IPv6:2405:b000:601:13::247:33])
 by vic-ironport-int.csiro.au with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
 23 Jul 2020 09:01:21 +1000
Received: from exch2-cdc.nexus.csiro.au (2405:b000:601:13::247:32) by
 exch3-cdc.nexus.csiro.au (2405:b000:601:13::247:33) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 23 Jul 2020 09:01:20 +1000
Received: from ExEdge1.csiro.au (150.229.7.34) by exch2-cdc.nexus.csiro.au
 (152.83.247.32) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 09:01:20 +1000
Received: from AUS01-ME1-obe.outbound.protection.outlook.com (104.47.116.57)
 by ExEdge1.csiro.au (150.229.7.34) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 09:01:17 +1000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V74ihddWdQY1Hoz4GyeSmyZCZvhP/VDnxYjUS9ZRYUZdFrcyNc47m3Jik0mWDSGH/Z5V7TTJF6nUGwVe494ai4JZNo84YsCkxL56R3rTzdFQKhPFadV8nggZJ31FhvK1tPJaCVgxfMgKqiVnWVzKjrhLUSWkzc/u1+x7vsE1wFu58ADPwtVKYXc0ddMQFfbpTT5X/0y8ebJeJv1LnsZ9oi3FWUHQUbWZPQFWaHZoAvRLjw26byy2FobS1ULxs1xHjIvjuifU+bFf+FXo1dBY1vQ0GLZupCnlD1y5yCGIulrs/VMuVPqCf8xffFjyM2zlXLxcdssLWazLlR5n1kvqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esWZv3sb2dHOjhRn6qApfceKU4Vbb6MoZP4SxvmEogI=;
 b=MDae4hgjhmMjWNWssvDVxpmU6RYJQWgVxOJZFzqgGaviE62HcXFZONWBpZM4xRzzHnid2VBtefsSL//hfQvEEaGlBUfBAC0Btr7QnZQarVLtnpGs65vs2QlKel3SCi3Fs5d4nlIRG27gYt/QRbPlmjYrpcFmPP2rB+x7bqmneaHZSR8pX0SKog59yzRy5Ab6i7Uqg4vZkOjdxv4goLRuZTbGQQPgBt6T/FsoCblsx8hVRE3O9g+vlbt0BFcHANNB7/49IhY5d2r4blbOxBQp5LYWQoOIWGXDrz86RQAP6gYtCxUYBvvBuExZrrP1gA60xGD9ODdysw7GHrIXnEHwqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=data61.csiro.au; dmarc=pass action=none
 header.from=data61.csiro.au; dkim=pass header.d=data61.csiro.au; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CSIROAU.onmicrosoft.com; s=selector1-CSIROAU-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esWZv3sb2dHOjhRn6qApfceKU4Vbb6MoZP4SxvmEogI=;
 b=D82R+WPU5EUoe9XRJjWmKYkfNgqa+jOK0d8ClUAoEwCuB5htlI2Pqq22F5Ox++wrtPde/HTpwZ3afnphDV2/V2udyK3NNVEv3d8h/We5d6ztAgWwKWam8aGFkT9qLsS386fleIJ1t9/XkBghLDSCR44WuXXDAGUSm8NJ3gLLUO8=
Received: from ME2PR01MB5203.ausprd01.prod.outlook.com (2603:10c6:220:4e::23)
 by MEXPR01MB0725.ausprd01.prod.outlook.com (2603:10c6:200::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.17; Wed, 22 Jul 2020 23:01:18 +0000
Received: from ME2PR01MB5203.ausprd01.prod.outlook.com
 ([fe80::d2c:4503:9b8c:ccb0]) by ME2PR01MB5203.ausprd01.prod.outlook.com
 ([fe80::d2c:4503:9b8c:ccb0%3]) with mapi id 15.20.3195.026; Wed, 22 Jul 2020
 23:01:17 +0000
From: "Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>
To: Patrick Delaunay <patrick.delaunay@st.com>
Thread-Topic: [PATCH] configs: cei-tk1-som: remove CONFIG_ARMV7_PSCI in
 include file
Thread-Index: AQHWRUPvW5KD9af1BUCZ1HoOn1U6TqkUbXiA
Date: Wed, 22 Jul 2020 23:01:17 +0000
Message-ID: <87imefp32c.wl-Peter.Chubb@data61.csiro.au>
References: <20200618074134.26629-1-patrick.delaunay@st.com>
In-Reply-To: <20200618074134.26629-1-patrick.delaunay@st.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM/1.14.9 (Goj?) APEL/10.8 EasyPG/1.0.0 Emacs/26.3 (x86_64-pc-linux-gnu)
 MULE/6.0 (HANACHIRUSATO)
authentication-results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=data61.csiro.au;
x-originating-ip: [221.199.209.25]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0182a3f-527e-47f8-c2c3-08d82e932472
x-ms-traffictypediagnostic: MEXPR01MB0725:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MEXPR01MB072517E0EDAE14DFD979E431BB790@MEXPR01MB0725.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KmJb492FgQev00Sy0j+2MdSzKXrOkUoEv5b7pMC/2E/AD32Yp4pbgZeVM8PckIJSg/J69EKeKbVIab1l5LvLHxGrsHs6NJpTKnsnSv0Gor3IYuzTicT3jA0VNujsWNUV/CrnTy/iEAOlTMkxiBP1uUCysSwSrF56yJJ2C8Fs0mPyZRfzgXMyMFdZgJjVK9ZqSifYF3AEdYmPyhNdlNZP2wAkVjrZXAEN3uIn8eOSdnKlQKydw5Wj+7e+qY4uhsTTcJ0+GHsDRGi5cLvoimk1KAk8pIS1KBWqDj/Jo9fSru61+GUjZHQM0J06X2lm6AST
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ME2PR01MB5203.ausprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(396003)(39850400004)(376002)(346002)(6512007)(83380400001)(4326008)(8936002)(91956017)(478600001)(8676002)(186003)(26005)(6916009)(71200400001)(54906003)(86362001)(5660300002)(66446008)(64756008)(66476007)(66556008)(4744005)(2616005)(76116006)(6486002)(316002)(2906002)(6506007)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: /sUWTWe9eBDRpsrqawPo4kzNH7lc98n37TcUtXGw7nT8w5JwO7PFCWl96RxGyngyvpeq4DCvbneeTRMChAdsG1Xz1oeQQ81iDS+fNWumJ7VyAIhYfA7azXeO6gJlly1o74QYgdEbWoNhRgeE4u9UQVhUz4jOu8x9WIQkKdvvyrfAvYWtRk9JPi7YKv3E4JDJ+On8Wrw//S5ZB399Ccuy87f58Xn0KeLQlI3rNaH3SLpQgqzDNVGC8lWDCTFS4842D/p5dTIJ9R7Ln2jue5bdXIxy+UckfI6uafgBN8UhR3nM13U/rPcanMpm9ci01oskWdiN/FT4YBHRhKdUN4H4gPMemWy6VXLLU3sCTnmEESdTn2QFf+t7xscGfcx751wvRy34+x1osZwJzjNeXh6Iixu1Dg4S+8PV57LIfmHp8AaAEe+WJtee+Ztur/Z8Zmb/l7JoDw4pVKRcAzC5NrM+hxIQEWtTk/j17IkvClNyxVrCYtUGYTjG7SwoSaLB5dhg
Content-ID: <4F7292995086D943AD0B6010F7DFBF9F@ausprd01.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ME2PR01MB5203.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0182a3f-527e-47f8-c2c3-08d82e932472
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 23:01:17.8836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fe05593-19ac-4f98-adbf-0375fce7f160
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JT7Bxd63QJgcpAV8CERKsG9/BWvoRLLkaY8rl2VCIzQ63FqWz8r5nQ5QeqA9PPgo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEXPR01MB0725
X-OriginatorOrg: data61.csiro.au
X-Mailman-Approved-At: Fri, 24 Jul 2020 09:32:24 +0000
Cc: "Chubb, Peter \(Data61, Kensington NSW\)" <Peter.Chubb@data61.csiro.au>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Warren <twarren@nvidia.com>, Trevor Woerner <twoerner@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: cei-tk1-som: remove
 CONFIG_ARMV7_PSCI in include file
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

>>>>> "Patrick" == Patrick Delaunay <patrick.delaunay@st.com> writes:

Patrick> Activate ARCH_SUPPORT_PSCI as other TEGRA124 target and
Patrick> remove CONFIG_ARMV7_PSCI and CONFIG_ARMV7_PSCI_NR_CPUS in
Patrick> configs file as they are migrated in Kconfig.

Patrick> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Reviewed-by: Peter Chubb <peter.chubb@data61.csiro.au>


I can't get at our TK1_SOM at the moment to test the patch but it
looks plausible.

Peter C
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

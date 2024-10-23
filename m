Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E9F9AE525
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2024 14:40:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EF56C78F71;
	Thu, 24 Oct 2024 12:40:31 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 789ECC6DD9F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 09:07:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1cOzCUuT+h28SBKbuDxhOwC4F1AFykZ9fbp4VOKkw3u1+7UVsw3wuC4CV8RYDuFQueS7Uz2wVgzFXG5jYCBlkW7NkCygqCkms8zNQ12o1w4O06czVehPv71tQrKOk/aXBLr+Ovnqoa/88lqJDnR5GmAJgxGz4fVcbNJqKh1cjjhUREXBKe5fyb5IVUBgm1m0CBuKnLswXLFRdpjLUbGhFXqSZUv+a3jxAwYyF+1inc0sp3wNAxc3Q8aG/jqz3AGoOcyfGr+iRgG9dsDOboE4OIhR4S6DeRPkqnhQmAR59iugCKd18K9CYexlKZbjuEqR/CqhE8HgkxfaKgif6yIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfMVXKsaWmqulWbr03UsE1rIai4awckk7RxgxaAIiGU=;
 b=EjlktbMcgV7l/uuRY2tQNhpSb3o0vhxlm7658rRg/CzQBciZ4IjDvJKLTi2RQ5DPXshcCWnRBKz/n1tWRdlAQ0lhT/bUYdcr57JC81B6+VCbKbaWkx2mFUTWJrIH7RtKMUsq3yJkYnDO1qqZj5Vitk8aRZsVTlIhcItd6wSP4Ez0M24yZV0MCmJVnHb0dYqAHK5X2785KyUU2nlF21XLOkk5UrmF3QnE4mE8J6ennRLl3dNKyiMb6hMu5fcG5YoOPT/pxw60DNBA40sK6ghJnzlM7hUTdacqfn9uD+kuUW4k5RPTcTbY72fq88CEhzMyDfOlculQ+GtPRQfUFVSIkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfMVXKsaWmqulWbr03UsE1rIai4awckk7RxgxaAIiGU=;
 b=mA/EZm+y1N90wYkGYnFhL6eQSNDdSBua6azVJLiAN4sjWhxwL1938KFqrCChWPECzMCK74TthbKeFzn/fbuh8pzGc5XwHDy5l79oja1SWyB1rr2vWc0BHMocV/xCvmyqwVWw2sW6UxBY9bRPbpYysBGkjHUDjutsLs3RA5zL/nQ=
Received: from SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10)
 by DM4PR12MB6349.namprd12.prod.outlook.com (2603:10b6:8:a4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.29; Wed, 23 Oct 2024 09:07:26 +0000
Received: from SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c]) by SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c%6]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 09:07:25 +0000
From: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>
To: Marek Vasut <marek.vasut@mailbox.org>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel memories
 support in QSPI driver"
Thread-Index: AQHbJMZY/tA7en8DbUuS+Zl7COVM+rKTqicwgABbA4CAAAHK4A==
Date: Wed, 23 Oct 2024 09:07:25 +0000
Message-ID: <SA1PR12MB869767A8D003AB114830D46A984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
 <SA1PR12MB8697AF99B0A56734FF65AD47984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <699f9d96-a109-40ab-9cd8-ed0c5b4b589f@mailbox.org>
In-Reply-To: <699f9d96-a109-40ab-9cd8-ed0c5b4b589f@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8697:EE_|DM4PR12MB6349:EE_
x-ms-office365-filtering-correlation-id: e2a171c8-6371-494b-21e3-08dcf3421cf2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NExzRzc2NEJ5cXd1Zzh0S3RDS3lCMlcyOVBjYjRGMUhQcW9DZGg5Qm81L2dq?=
 =?utf-8?B?dnhZajZsZkNlNWlCV01NL2JqZXRRWG1pODRsa242VTZiNWE2eWY0RVBqczli?=
 =?utf-8?B?UWx0OFlCa0p1K1duOUMxc0hpSEF6U2ZOeW1DR0ljVzVTcnN0MStITm1NWVpY?=
 =?utf-8?B?UGVrQlUva3hEelFoZ2xBRzZGa0kweWkvMlZ6TXFGZmRyWXprY05NUkhlQWJQ?=
 =?utf-8?B?ZS9MVVZWdFhhcUpMZVJFcjlmTmVZUUdOM3RjNDd2NVhiTDIvMTR6L1MzS1Rk?=
 =?utf-8?B?RXdFQWpTSkw1REpIL0ljVHdrTmFjUUk1cGNQaVdoNnB1cDB5TW0zUGZWVTJI?=
 =?utf-8?B?cVpENUdNdnpSRzNsVXpIRlVvUzNMYmNGanNJMU5LbkpUcEgwMW4wOU10eXp5?=
 =?utf-8?B?SFhUYS9NTFVxZnlDTkJrbGFGUlAxclY1ZVVUeUlpR21jbUZ6U3dEcEtqNUg1?=
 =?utf-8?B?TVJzZWNqbnE2MmFUZUJwektFTmdESWIzb1pPaVlVMFFva0dDSUVlMlpXcEJH?=
 =?utf-8?B?REZtVUdaZ0daWjhaZnVtZDdWcDZTSEFCblhCNlptNEVRNW05UlZTZHYrUTJX?=
 =?utf-8?B?a0xteUFXK1ZDaG1Oc3RJOFhab1c1elJiY1FUYWVBOHNLQWMyYkdvK0RWUGh0?=
 =?utf-8?B?WVFmZVlhbkwzSVJ1TGY2dVRtNkdpVExuam1rOFZsWXNmMDE2VlFWc2Ntb2Fi?=
 =?utf-8?B?UzJwdlhpZ2lGcXM3NGRPT3kxWDluQ1NGYWtnaTFnVlZXb2t0cmZFdllIK0l1?=
 =?utf-8?B?cjFQdnZtU0lhbDJQZUwrTzNEVnl6RCtjOW52VjhmM1NLRUtkV2xiNi9nbVhD?=
 =?utf-8?B?aDBac0VMZEV6aE41WjlyeXBBWW84Y3VPMGVDYXVDNkNndXZ2Y2c0T0NscjF0?=
 =?utf-8?B?cDNiM2lMNms5bkFFTWVqVVZTRGhRU1JSRVhKOU1VNUttbE4ydTFCOGlKN3VM?=
 =?utf-8?B?eW95ODBNVWV3dUNOVkQ5MVduVytsbmEzbm0wRUdZTExwdE41WlRIUytJSjhz?=
 =?utf-8?B?dVA1bU5aV2E4aEpPZi9PMHM0WW9DanpEd1NtLzlCMS9pYy9DOG4xZXRBZ2pu?=
 =?utf-8?B?cEkzVERHY1huSFN1UW9HZHdZRlJzQ0licEJvUVlaZmh5Wm0xTnBqWFp2bzJp?=
 =?utf-8?B?YjNkM0lTUXdTOU42MndCcVluc0hqajdnS2k0ZmUrSkczM1VUbzlLckFScGJJ?=
 =?utf-8?B?YnM0TzIxeG9mUFI0RTV1STh4Q2JtR1U2ZnlPYXB6MExPZTVNUm9sVzk0aWpB?=
 =?utf-8?B?SWtPcXRVZHBzTy9UTDZLRmVWWmVsUE5DY3ZHNUZiRTZWR05haUJnSWtST0U0?=
 =?utf-8?B?UjQwMyt5RUR5U0FKVzlpb20xZ3diQmZqQ0FDV3NoME02QU1BNVF3WHRGbkJj?=
 =?utf-8?B?ZXJWZ0p6VExZZUFzZ250c3hnQkJCV2I3VWVtdmZ6SVZHYVY5T3I0WWRkYVVr?=
 =?utf-8?B?NnB6UmxyOVNQRHdxaHpvQlFTU1hxbE10akNlQzlUNnhPNFJjeWFDZFVaVmZ0?=
 =?utf-8?B?RVk5QmtxV1ZQd2NaM2YwQnFGRE56dmhGV0Z2WUF2cWFicmI1TDZ6RU44WHl3?=
 =?utf-8?B?TGVXbEhLZ2IySERhbGJGV0I3bVVnTTJURDVxUWI3eHVqOFRqYm5wNnh6cVNw?=
 =?utf-8?B?T3hETFQvYzBpZkJmR1JHMkF6ZGNMS3RheDJTU0ZIWEJ5L1d0a2MwMzlRVHpk?=
 =?utf-8?B?Um50WDJLNWhSS08xeFBRZUoxOVgzWUZCdUx5MllpUGF4YVFCVGdpNER0T2VJ?=
 =?utf-8?B?TE9rUjBWc0JHN2wzRUNtQXhOaU5lWEh0b1cxcXNrTzYrcnI4bm9QVFFuamVs?=
 =?utf-8?B?cXVnODd1VGxXSWE4K2p4MG5HQnBEVHJYdnBCUElkY3RmWmtCUUtTUk1TY0tM?=
 =?utf-8?Q?oI8xtL9zuv1K5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8697.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlZvYTB1aUJ0QjU5Q3Vna2g4Z2FiWXhkaG83UjZrcU80SlJzQnp5SDR5QjhB?=
 =?utf-8?B?T096UCsya1FLUk41NHdjVFFGOTBoM3pvei9mYmVySFlkV044RmhDZzlQekd5?=
 =?utf-8?B?RVJ0WExjV00ya1hlelg3ZzBYSWlFbnVidUZzVnBmR1RmMFhmVUx0eXlaWUdh?=
 =?utf-8?B?SktlLzcraGZPc003MjdYK0p2c1RCYTk1ZjkwT2I3Yi9tSVBpQ2VUWEEwemla?=
 =?utf-8?B?SmxOcGdWazVEVUJacEY0Q3FQM1U1TUVROHRDeDh0RHNyR1lRSEs1T21wNFd5?=
 =?utf-8?B?ZWFBemZvYU45VlhZRXY4bURvWGx4TFhpNEJQSUpPd090aFFiMktzUHRWV3B2?=
 =?utf-8?B?YkFDM0s4b0lmZHgxTnYwck84ZUVKelVVdHF3eWlVcFBZNXNOQTU4OG5PRHhC?=
 =?utf-8?B?eGxBOGFGb1RMZTNZeFpmR2Y1VFVWbXpxTmtxMUd3SEFRaUJBUzhmM1NmcVVO?=
 =?utf-8?B?TWRzYTNSb0JsV3p5K09aRXlxMCtOYmNSUFZ1QWY1U1BiaFhOeTdpcVBmMXRa?=
 =?utf-8?B?T2VtOTlSV0VpenB0VGRqY2hYTXpJS2Z2K0RYVjgzZlQ5WkUwOVZGR3ZZeTVm?=
 =?utf-8?B?Y1FTWW4vMFlDVzJ5OUZOTitOSEFiSjVjeWMvTGpBczcvYnlydWFkSEFOdldU?=
 =?utf-8?B?VjVlTWdwcWQzbWlKT3V4RU9YYjhQYVdyOXBPV0J6UXZNQmR3WEJNaE5wZDNs?=
 =?utf-8?B?emFTL0kwSXdtZm1iV2pvY0NYU25XMHE1Njdndnl4cXd1NnNhTlJ4bUtXejNi?=
 =?utf-8?B?K2drNzF5WldWV2txRUpkcko4dDhTZkRDYXBBcXhxSHdTSGtkdFR3OFR0UTJK?=
 =?utf-8?B?enBiaU5qOXZabkt6ZHhtNFl6WjAyODgvaU9FbVl3Y1BSdlRnbHdRYVJNcWZD?=
 =?utf-8?B?MVdJVWQ1WGd2YitIS0x1TWw1VlpxSHQ0T2t3UGtlYW4ySTBoQ0pubVpaUkFo?=
 =?utf-8?B?NWN5VjFaUTNyRjhTNkVYTnB3cU95QkFkRkQ5ZEpIb1ZKMmdaY0ZVYUU1VElx?=
 =?utf-8?B?QmJpQzVwL1k0Yk5YSmFSM3FuSk9ra3lBaEZrWXdtOGZVckhPOUU2c2s4clh5?=
 =?utf-8?B?SEYxcVo5S2lNbkhubVNUVFFTQWFSSVdhT3hWbUd5OWdnVVYzd1RMVFRidHRx?=
 =?utf-8?B?UThlUTNpWFZpYmpvYjZYUFdIb0NhS3RGRTF5blc5VUVvc2k0KytoMGJDeTNn?=
 =?utf-8?B?em9IZjJOSEQ5VFQ2Z3JnMGpSdmVYOTNrVW1ENDBtL2lDUzUyVnUrRk9VbXVO?=
 =?utf-8?B?azRjUWJrRERvNk5pakFnRTJGN045TTFHdzVSbzZPK3FpRThOdVI4VnphSGh4?=
 =?utf-8?B?ZTNtanMyRGpKSGtQWXRlM3pNZkpic3Y3RlBxVCsvS3RqamlTV1BCVENOalBw?=
 =?utf-8?B?dnNtZ2dGYTdZYTI0OWJVc0g0elBmOThsSjk1N0taTzE5cjVXNHcvdW00Vm1m?=
 =?utf-8?B?WXVRY1h2U1BmaEF6aGEyd2t3VFBlc3RrY3RRUXZseGpUQWdLQ2gvNUpxMmtO?=
 =?utf-8?B?SUptWFV1UzFBVnJrbDlHYjBDL3NFa0FKai9mVG42SXRiSWZSRm95cDc5cWx3?=
 =?utf-8?B?SUYxV3czRVRjeDI4ZEdqVUgyZXI2MXowUlE0ckJJcWJVeGswQXhjRnlsR0NB?=
 =?utf-8?B?QW9NVVFacXF5S2h1TUorbE9zVE41RURxRURWQUsxWGVvNzdNRHExSmhaUWgy?=
 =?utf-8?B?cnNtd09neERRUmxtRXZlZEs0ODFienZuWTA5clRzeWlqeS9UN1o4NEVTMDVZ?=
 =?utf-8?B?L0dieVQ4VDJPUnhwOFpZYWVDRDZwMUNrTEpHOGpUbENOcERaSmVxU2xnOEVQ?=
 =?utf-8?B?N2lOejBiaGM0ZzlLOW9LTzNBNitSbnA4VGQxTjV2cXJyZ0owTDlCT1VzSWR0?=
 =?utf-8?B?VlVJQUFsWHVsUDA2Q2syTDdzTGQ0ODZWK1M5MXNCY2hvNkh2akZ2Sy9FNm1H?=
 =?utf-8?B?VnBheFpIVTlydnRVWENHVCs5YWV1UU1waWt0UnFFM0Z1U25NYkg4VU9GVlNM?=
 =?utf-8?B?NU9aQThzeDZLVnEvekJ3djZ3ZTlQUFo5NU9UT2YxVVZhZnhVZEgxME5yMTgy?=
 =?utf-8?B?VDN2dlZGWE1RdDRwTSswQTdablBNMEthYlo5YjBOcXZudTlLeXNQcGs0bkFH?=
 =?utf-8?Q?bO+U=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a171c8-6371-494b-21e3-08dcf3421cf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 09:07:25.8603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TA9ZyWTj0xv82b3L2gNUf0XAfO9Vzn8IR3arc1CedWV3JQ9Z3VUujBfvv7qxz6IEEc/sFeDSFVs55V7yWd7QEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6349
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:40:30 +0000
Cc: Tom Rini <trini@konsulko.com>, Michael Walle <mwalle@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, "Simek, Michal" <michal.simek@amd.com>,
 Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
 memories support in QSPI driver"
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGksDQpUZXN0ZWQgd2l0aCB0aGUgbm9uLXN0YWNrZWQgZGVmYXVsdCBzaW5nbGUgY29uZmlndXJh
dGlvbiBvbiBaeW5xTVAgemN1MTAyIGJvYXJkIGFuZCBkaWRu4oCZdCBzZWUgYW55IGlzc3VlLg0K
DQpaeW5xTVA+IHNmIHByb2JlIDAgMCAwDQpTRjogRGV0ZWN0ZWQgbXQyNXF1NTEyYSB3aXRoIHBh
Z2Ugc2l6ZSAyNTYgQnl0ZXMsIGVyYXNlIHNpemUgNjQgS2lCLCB0b3RhbCA2NCBNaUINClp5bnFN
UD4gc2YgZXJhc2UgMHgwIDB4NDAwMDAwMDttdy5iIDB4ODAwMCBhYWJiY2NkZCAweDQwMDAwMDA7
c2Ygd3JpdGUgMHg4MDAwIDB4MCAweDQwMDAwMDA7bXcuYiAweDgwMDgwMDAgMHgwIDB4NDAwMDAw
MDtzZiByZWFkIDB4ODAwODAwMCAweDAgMHg0MDAwMDAwO2NtcC5iIDB4ODAwMCAweDgwMDgwMDAg
MHg0MDAwMDAwDQpTRjogNjcxMDg4NjQgYnl0ZXMgQCAweDAgRXJhc2VkOiBPSw0KZGV2aWNlIDAg
d2hvbGUgY2hpcA0KU0Y6IDY3MTA4ODY0IGJ5dGVzIEAgMHgwIFdyaXR0ZW46IE9LDQpkZXZpY2Ug
MCB3aG9sZSBjaGlwDQpTRjogNjcxMDg4NjQgYnl0ZXMgQCAweDAgUmVhZDogT0sNClRvdGFsIG9m
IDY3MTA4ODY0IGJ5dGUocykgd2VyZSB0aGUgc2FtZQ0KDQpUaGFua3MNClZlbmthdGVzaA0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hcmVrIFZhc3V0IDxtYXJlay52
YXN1dEBtYWlsYm94Lm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDIzLCAyMDI0IDI6
MTIgUE0NCj4gVG86IEFiYmFyYXB1LCBWZW5rYXRlc2ggPHZlbmthdGVzaC5hYmJhcmFwdUBhbWQu
Y29tPjsgTWFyZWsgVmFzdXQNCj4gPG1hcmVrLnZhc3V0K3JlbmVzYXNAbWFpbGJveC5vcmc+OyB1
LWJvb3RAbGlzdHMuZGVueC5kZQ0KPiBDYzogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJh
QGFybS5jb20+OyBBc2hvayBSZWRkeSBTb21hDQo+IDxhc2hvay5yZWRkeS5zb21hQGFtZC5jb20+
OyBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT47DQo+IE1pY2hhZWwgV2Fs
bGUgPG13YWxsZUBrZXJuZWwub3JnPjsgU2ltZWssIE1pY2hhbCA8bWljaGFsLnNpbWVrQGFtZC5j
b20+Ow0KPiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT47IFBh
dHJpY2sgRGVsYXVuYXkNCj4gPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+OyBQcmF0eXVz
aCBZYWRhdiA8cC55YWRhdkB0aS5jb20+OyBRdWVudGluDQo+IFNjaHVseiA8cXVlbnRpbi5zY2h1
bHpAY2hlcnJ5LmRlPjsgU2VhbiBBbmRlcnNvbiA8c2VhbmdhMkBnbWFpbC5jb20+Ow0KPiBTaW1v
biBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz47IFRha2FoaXJvIEt1d2Fubw0KPiA8VGFrYWhpcm8u
S3V3YW5vQGluZmluZW9uLmNvbT47IFRvbSBSaW5pIDx0cmluaUBrb25zdWxrby5jb20+OyBUdWRv
cg0KPiBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+OyB1Ym9vdC1zdG0zMkBzdC1t
ZC0NCj4gbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNl0g
UmV2ZXJ0ICJzcGk6IHp5bnFfcXNwaTogQWRkIHBhcmFsbGVsIG1lbW9yaWVzIHN1cHBvcnQgaW4N
Cj4gUVNQSSBkcml2ZXIiDQo+IA0KPiBPbiAxMC8yMy8yNCA1OjE4IEFNLCBBYmJhcmFwdSwgVmVu
a2F0ZXNoIHdyb3RlOg0KPiA+IEhpIE1hcmVrLA0KPiA+IFRoZXJlIHdhcyBzb21lIGlzc3VlIGFu
ZCBmaXggaXMgc2VudA0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3UtYm9vdC8yMDI0MTAx
ODA4MjY0NC4yMjQ5NS0xLXZlbmthdGVzaC5hYmJhcmENCj4gPiBwdUBhbWQuY29tL1QvI3UNCj4g
DQo+IElzIHRoaXMgb25lIGZpeCBvciB0aHJlZSBmaXhlcyBmb3IgdGhyZWUgZGlmZmVyZW50IGlz
c3VlcyA/DQo+IA0KPiBUaGlzIHNlZW1zIHRvIGZpeCBSRUFEIGVycm9ycywgd2hpY2ggaXMgYXBw
YXJlbnRseSBhbm90aGVyIGVycm9yIGludHJvZHVjZWQgYnkgdGhpcw0KPiBzdHVmZi4gSW4gbXkg
Y2FzZSwgcGxhaW4gYW5kIHNpbXBseSAnc2YgcHJvYmUgOyBzZiB1cGRhdGUnIGNvbWJpbmF0aW9u
IHdpdGggc2luZ2xlIG5vbi0NCj4gc3RhY2tlZCBTUEkgTk9SIGRvZXMgbm90IHdvcmsuIFdhcyBz
dWNoIGEgc2ltcGxlIGNvbmZpZ3VyYXRpb24gZXZlciB0ZXN0ZWQgPw0KPiANCj4gPiBOb3Qgc3Vy
ZSB3ZSBuZWVkIHRvIHJldmVydCB3aG9sZSBwYXJhbGxlbC9zdGFja2VkIHN1cHBvcnQ/DQo+IFBs
ZWFzZSBzdG9wIHRvcC1wb3N0aW5nLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

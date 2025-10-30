Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5101EC1DEA4
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Oct 2025 01:31:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15B5CC62D64;
	Thu, 30 Oct 2025 00:31:56 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6600C62D5B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 00:31:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyMkTFeVxlZVBl+NSYdKA3Ra2gudYSIN8GWek1/ten/UIvUCwjS4FAmrendshu+w6PjwpZrQGAKUH/B7TxjsSD2I8ti7QykTHMCZKLOTkQXHrour1F9JmDo4FwB9OofX7pKfHurRj5z/QDm8RSq8dcxVdJ7ZoDAvl1oKYsPVWG5LB47cFaeIEvDNiE8iD5zuT1WY7jiCmzN+QgpjGyPfEfOiwMuTKwwY4I7yy0+80By3Qgk51sVSyZkG/7M0P/uDKzADtY5CN3ZgStY/RHf/b6Kql9j2accaox6ye+9RykbZBBvE4jClayUlp8LJkhcT70cyCwpF/b+Xc1h8iA3Iqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55n4h5U/ACeIFOfHRrdSYW/qQGhwwlQ6AAhye1hpzGQ=;
 b=GdirRaeonCW1TR9aT8PsVIM2TG+0oZ6XusOYiyxtf+Ogjxdug30A1K7fQQUZllAFBwyYJREMV1yS8atmFaelyztVHrIpqdl/snCyzMhAgwtgAZ1WmS4PSyl7iUSuq78DvGushh0qP9hoIGSu8a0ZWBOIZriYG1StDzCFC0mNrXutbLOk6LBm1GPkD924z5AK4HdvUBBkyuIk/Th76VUx3JaldsA8epzLIyIwAG2gcT9oil2kUT5+yCQGn/mie9iUUK+roTdHCOqNvoy1IW/FAin2mSCJBxfmSBIoIzlP/Z+GL8f9pT1OaD+QrkuEoJ5f44WggwI6ltGW+vJVsW1DVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55n4h5U/ACeIFOfHRrdSYW/qQGhwwlQ6AAhye1hpzGQ=;
 b=gq2SSDIrkxEbwa9vMn0b+1wYwS5R4vXhClCNPLYMWiiQlch4N9JvVgmU4Phucdjn4iSHwwzTgC/S3vPaP+UXWsg4lYgVAtXPT5tuhfuBI/6OSwmSuVIhmNu9IX7LUhu7BXkZBcn237Bi25o8buNUKKHJbDdBZfT+h0Upcz1xrzEbCjToicp7faqx2IUiwxQnWwyqSu1p/yllbOP16UEf82PiCLELQKfQBYfatrLZXcZa/KQoFtHTmWFYWuGKlWFsJJb5yjNrf73K4M848SF7Vl8/RfFf4z2CeF4LWSQ+Q2ctl5BQ1oqMhYItS7vnwGldZB4MNuvXyBVI9odsn2tQAA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7562.eurprd04.prod.outlook.com (2603:10a6:10:1f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Thu, 30 Oct
 2025 00:31:50 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 00:31:50 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Fabio Estevam
 <festevam@gmail.com>, Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH v3 00/12] remoteproc: Add support for i.MX8M[M/N/P/Q] and
 i.MX93
Thread-Index: AQHcQu2j0DXsqvqaHUeMEYLUkufkvrTUUYsAgAMx4ICAAl8esA==
Date: Thu, 30 Oct 2025 00:31:50 +0000
Message-ID: <PAXPR04MB84591B0C66FE17F3E0792BB988FBA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
 <CAOMZO5ASxBCdTQFfoUA7k5aXKwQZS+MC75kHw7uHoHsF1AgbcQ@mail.gmail.com>
 <20251028121607.GF9371@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20251028121607.GF9371@nxa18884-linux.ap.freescale.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DBBPR04MB7562:EE_
x-ms-office365-filtering-correlation-id: 8acac496-0b40-4e3f-9b0d-08de174bb782
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|19092799006|376014|1800799024|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?R2MwYVZmbkFDOTJBcnVXVTQxQmtCTmxrZW9zR2VHQ0hPRm96S0czMDF1SWxu?=
 =?utf-8?B?L3VLQ1M4UE8wTXZsc0xMRzc5S3RySXRvRjVVYU10bUNMcHRHWWViT25kOXda?=
 =?utf-8?B?M3k1dFRsS3drT1p1elp2a1h4aG0yV2ZBcWViTnh2dlZnb3orZE0wSTloNlJk?=
 =?utf-8?B?a2hwN01ZZFdWZ3dYeXpPWXoxR05WZ25tdDNLaWhvR2pRNXJqUnNxYlRvR0tT?=
 =?utf-8?B?N0wvaUh3N29HNlc4QjVqYzh1WVhFVWxOTVdBaEluSFE1c3lNMVovYmE3ZFph?=
 =?utf-8?B?VWNPaW9JK0VOdnNpano1aE5RcGNsUkw4cmQxUUZ1cDExOGJnYTRZRGtXdU5v?=
 =?utf-8?B?VjYvYnFmTnJqaWNPN2I2YTFXbkptSk11aTNsUUZ6Qy9pVEpzRjh1SEVDbE1E?=
 =?utf-8?B?VGpwR1c4SUo1VllwcW02Q1VUd2EydEZnem52NTEzeUZJTS9BdUwrVFhKdnhC?=
 =?utf-8?B?SUVuMjROeWVEOENrQitGbEs5b1ZJVXJTcTUzbXFIbFZxVnk4aytvNDVSd011?=
 =?utf-8?B?WTVDOURMQjFxdnlOUlVaUDl2YVI3VEQ2WDQ5d1pXVEl0UmpnUTJlMXh0Mmo2?=
 =?utf-8?B?Wm9oV28raHVnNzBDdXFWV3dRK1pWTW10ZkhIcmsvN1h6SFh6ZFNjZlVjZHdP?=
 =?utf-8?B?Wmd1TVV6czJEeDNyZVlEcjViL1A1d2RwSmJzTW5ZVkxjTWtSeUpqVkJPMWVZ?=
 =?utf-8?B?R0N0aTJKQWZ5Mm5sN1E5dDIrMmQ4WDM2clhCL0c0aXVBRmV6Z1BFR244UlJT?=
 =?utf-8?B?NG5zSlA3RnhVZCtRNExKdG4vYWIrZUdLaXh5dzBVbUNPSGw0NjhFNmlCb2ts?=
 =?utf-8?B?ME54NTU2akxjbUpJMzdHeWxsalBSdWJVeWJITTZ6cE8vMzR6bDBWdzA0b3dV?=
 =?utf-8?B?OTMyUWp0L2NOdDJ4RmdtSHVqNG1qM1MzV2lVNVV4bXNjWURhQ2pUWjNHbnFa?=
 =?utf-8?B?TGY3WTlNR0FJRHdSdHViZWErYTFrRXY2N2pnYXIwQmNPTWJWbFQyWTFPTWhl?=
 =?utf-8?B?NlA4QkVhR3ZFZk1CVjE0anBnWi9wa0FrOEM2KzA5YkRUY0RxajkzSVJxdzZ4?=
 =?utf-8?B?UFlZdE1nVUZEV1BMbGFmcDNGbVQzZ2tab1dqMUdDL0J6am8yRGZGaWtFbGFr?=
 =?utf-8?B?WTJDRjg2OHlWTEFhdnNkcWxWSXYyalJ3aEFtU3YydEN0ZGFMSm1DSHpZUHlV?=
 =?utf-8?B?YjJKd1J2eWJUZVo0R04vU0l2WjJoRnNiWFdIWkRVcnJKSkszNS8xSUFwaWYy?=
 =?utf-8?B?bndXTzNsWE5IUnQwZ2NDNjdaNDBiWWVOa243SWZ0bXZEZFhBTUtSMHJ5Tlc5?=
 =?utf-8?B?MW41WTk2c1NrZTFTNlRpdWlaSWo5dEFka2FYd2ZhVDZSeXUzOW9lcFF1WUpp?=
 =?utf-8?B?NnZtUjR2YkoyWlN5Ykp3WGVJWGpQR1JCd0ViYkkvZ2tSY1JTdzFZYXk2eGRv?=
 =?utf-8?B?bXVRL2lML2JZOTJuWjUyaWhSZ0dJZVorbUhUbXovc1VjVU1IVm5iM1pTazRo?=
 =?utf-8?B?aHRMZWo1RkZRNTRqMDZ6aXpnclY4dDFMNzBZOXJZMk1VblNZV1dORGs0NG12?=
 =?utf-8?B?aTRuSmJzRGM5Qi9sOTFhV3dCYjRxNndVMUtoOHdVNFJZb2FZQUhrcURZRlN2?=
 =?utf-8?B?OXFpOGxMZjNTL0phQ0ZOVnJiVU83bzBiOXZCaHZZMzlPOWU0T1FkTDBRcHJ3?=
 =?utf-8?B?ZTVKd01jSGVMQVdmV3pyN3NqYUpyeUllRC85aVhBNHdaK2owY1doM0VHbkdI?=
 =?utf-8?B?b0ZYcEZPL21jOW5CaVRZWWlkc2ZjQ2RVRS93OGhUcWc2dkpUK0c1ajJJVzN2?=
 =?utf-8?B?U2s0ell0ekNTMXBxbGNNRWxqenlHczNWOFF0cHB6QWVlY0szeDQyb0xtSkRH?=
 =?utf-8?B?TUlnNnY2aGV4cEkvbjhaV1pGQ1hUQzhESHdLL1Jib0VHeUVRNVYvWERhRFN2?=
 =?utf-8?B?ZnVEaEdSYTIrVUE1TGtLcjF3TUZvNEJGQ292S210OS9NVlordjZ5d09LWjBt?=
 =?utf-8?B?UityNVNoOVo3ZnlGVFVla3BKbS83OWU4eE1UU1lodjk1VHptVERUR2ZJbnhU?=
 =?utf-8?Q?Cne/NU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(1800799024)(7416014)(366016)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2VzU0p3MTFWOTJDcEN3dHRLVkFEaFMzeVRyRUZMbmIrNGFtWmRlM3ZqZ056?=
 =?utf-8?B?Y1IzNUF4elRVQmNIOVE4Y3JTb0Q2R2NPSzg5SUtFNjE4TmE5cldza1hneHJJ?=
 =?utf-8?B?NXBrMURkWTVUdkxaQnBpdGk2YWFxazZoZE1pMm1kTksyRXZ2dHF2eHB3YUNr?=
 =?utf-8?B?MUdkRUxiNUhLT0E3RGhKWWNWNHpRdXZ4TWt2aXJ3d0FNSTI0VkNpeGxpazZr?=
 =?utf-8?B?WldPQVpQQWxLQzE2ajkzZ3YyYkNCZndEa1VFMVFRcDFNSG1nS0lML3dSRk5z?=
 =?utf-8?B?OEw0WThrYXc1SmRRVWtLMGNLVC9weTRnY2ZDT29SdGR3aU5FVXFiTG5ITUhZ?=
 =?utf-8?B?UUhZeUZxbVliNmI2eE1SaTVKamdVVEZzY0xUaSt6d0NOSVlGQ3l0eDVIODJN?=
 =?utf-8?B?cFFxQUhOT2FuYWNaYjZiUm1HOTRYNGRTRVdWRU11VS9DSVlOb3FmODhMZHVF?=
 =?utf-8?B?TXNyVnVSTTNrRlFTS0x1Wm1ESFd1UGN2N3ozdjROMXpxQ1pPcWZ5bk1aRGNR?=
 =?utf-8?B?U2U4aTg5bGtuanFnN0VTc0JNNmR3dTdnV3lZSFhORjM1dElKL0xvYWJuM3M2?=
 =?utf-8?B?YVFxalIya2x2MEgreVNrOWJ5ZWJvWVk3VjI4cUFLejZONktxamZwdEV2ejU1?=
 =?utf-8?B?UHhPNVZHaTN6dUpMelI3REZMVXhDRTJRMDlpVWpDTjVKdHhhZWRZaHR3RFpF?=
 =?utf-8?B?UVhRU1hINjRFTnRjVUxteFBxY0NLYWJvZTZUeXM4WkVZMVZUTUtibWg3UDZv?=
 =?utf-8?B?SG1XOTFUSjBiV2JxVFZwU0oxVDI0OUNqOG9SR3A2QkNvb1R3MEFBTkIzZHlK?=
 =?utf-8?B?b2tVaVd0N0lCcGpPTXhRbmdVQUs4dHBTTUxMM2VSeEFxbFlGZHB6dWtVTDdK?=
 =?utf-8?B?NHFlRHpJOTFLNk8wdmVWWDZCVmE0N3VYWGJuRTNaUHRzUDNwSHdsN21LVmMx?=
 =?utf-8?B?RFdjTG1wdWdOMERMdDRHNkxlREZGdjc4eDlkT2JwNGxuRE5BSnRkc3doalR6?=
 =?utf-8?B?NVJwMkQ5cXV5SSs4eGxURGorVFR4Z3h0ZElkaSt3di8wbmZUdGczSkwzMmor?=
 =?utf-8?B?N1BITStKYTMvMm9CTEJ4THN1MWZSU0FXVjhuM0UvLyt2ZUxXL1VwVXB4VVlv?=
 =?utf-8?B?dVZLYjhOUGk0RVg3ZEZEbmcwV012RnpucTJGbDQzTkwzN3VPQjh1WlJFN3pG?=
 =?utf-8?B?SWx4a0h0QlNvZG5pSjlPRUlxVGJzcDJUd21FYlJNSUxWMDhFN1BZYUVCWUQ1?=
 =?utf-8?B?dmZCV2h5ZzNubVA2UUhnMmg2T215Zlc3azl4VTNTam9iS3RocndEMnM4REJ4?=
 =?utf-8?B?bzY1aWl6dEI5NWNTOTQ5SUpVQUZaSmVKYlhNaVJDOWNzN2FrSFhjZWcyeHRs?=
 =?utf-8?B?ZStsMTlpa290cEhQeXE1UzNEMHF1dUxieGxGKzlYQWZUQWZseWJMNUhxVytI?=
 =?utf-8?B?SzlKWVE4UllXTXFMbldyZy9DSHd5WCttc3VhSnJuaHBXM0JjYkQxSGZPVXBM?=
 =?utf-8?B?b1cweTNCcTVaUDd1ZVZpcXRmTTNCWFA2NjFtd25Xbml5dkNLaEZuM0FKbkw1?=
 =?utf-8?B?UVF5Qi9NQzNLb3FxdmR5RS8wdmNSNjFKM0NzRlZJeTlGN1NmZXUxcUs1VHZY?=
 =?utf-8?B?SUU1R2NkU2E3ajE3dFhsL3JGbzk3d1BwR1gyc1ExU2ExWTkyRHp5OWNqMG5V?=
 =?utf-8?B?c0xYTVZyUjRON2JEdXFmZjdnODVuOEpIYXE1QnRycjd4T3UraXIrYXJwNWoy?=
 =?utf-8?B?YzNzWEtWa3c1Y2lZanZYWWxNbHNHUWZNODVCUHV4Yk9wOUVOWHRVRGxnbGdH?=
 =?utf-8?B?SkkvMmtnUk9hMVJudldhQm5PU1J4ajJzODNWcDNRckNFZ2plMDd4OEJhejdm?=
 =?utf-8?B?aTZwRmFoRFZkYmF2QUJPdXZGTDN4Ykp1VFg1K3B3ZWFZMmdpa2NCczZVQkZh?=
 =?utf-8?B?eGF6a3dtNi9OWnZjRXhNTmM0Y1lSLzMrZ0JoNHovMGJWZEtRVUlyOHNvb2p4?=
 =?utf-8?B?cTJobWc0dXUvUFB4V2Q5anZVWExNUFNWQnpISFNqYVJKUHMyT0pXVHRkOWIz?=
 =?utf-8?B?QXJkS0pTOWkwUjZla20xSlFIQ0JVcFFJTzhBemp1Q1lVTVNoQkMzRzFwZnps?=
 =?utf-8?Q?9/Ss=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acac496-0b40-4e3f-9b0d-08de174bb782
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 00:31:50.1808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jO6EszyfUaPB87oa8j3LTj9YB/n7aXbt8ZxK0JTP9tG6oGntHiaPwJhlul+7XO+koZyhD3AucGYu+IEiqSkDEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7562
Cc: Tom Rini <trini@konsulko.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Andrew Davis <afd@ti.com>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 dl-uboot-imx <uboot-imx@nxp.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Hari Nagalla <hnagalla@ti.com>,
 Ryan Eatmon <reatmon@ti.com>, Stefano Babic <sbabic@nabladev.com>
Subject: Re: [Uboot-stm32] [PATCH v3 00/12] remoteproc: Add support for
 i.MX8M[M/N/P/Q] and i.MX93
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAwLzEyXSByZW1vdGVwcm9jOiBBZGQgc3VwcG9ydCBm
b3INCj4gaS5NWDhNW00vTi9QL1FdIGFuZCBpLk1YOTMNCj4gDQo+IEhpIEZhYmlvLA0KPiANCj4g
T24gU3VuLCBPY3QgMjYsIDIwMjUgYXQgMDg6Mjg6NTBBTSAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3
cm90ZToNCj4gPkhpIFBlbmcsDQo+ID4NCj4gPk9uIFR1ZSwgT2N0IDIxLCAyMDI1IGF0IDk6NDji
gK9QTSBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gd3JvdGU6DQo+ID4+DQo+ID4+IENJ
OiBodHRwczovL2Rldi5henVyZS5jb20vcGVuZ2Zhbi91Ym9vdC0NCj4gY2kvX2J1aWxkL3Jlc3Vs
dHM/YnVpbGRJZD0yMQ0KPiA+Pg0KPiA+PiBUaGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIHJl
bW90ZXByb2Mgc3VwcG9ydCBmb3IgTlhQIGkuTVg4TQ0KPiBhbmQNCj4gPj4gaS5NWDkzIHBsYXRm
b3Jtcy4gTW9zdCBvZiB0aGUgaS5NWC1zcGVjaWZpYyBsb2dpYyBpcyBwb3J0ZWQgZnJvbSB0aGUN
Cj4gPj4gTGludXgga2VybmVsIHRvIGVuc3VyZSBjb21wYXRpYmlsaXR5IGFuZCBtYWludGFpbmFi
aWxpdHkuDQo+ID4NCj4gPkknbSBnZXR0aW5nIHRoZSBmb2xsb3dpbmcgdXRfZG1fZG1fdGVzdF9y
ZW1vdGVwcm9jX2VsZiBlcnJvciBpbg0KPiBHaXRsYWIgQ0k6DQo+ID4NCj4gPmh0dHBzOi8vc291
cmNlLmRlbnguZGUvdS1ib290L2N1c3RvZGlhbnMvdS1ib290LWlteC8tDQo+IC9qb2JzLzEyNzQx
NjgjTDI3Ng0KPiANCj4gTm90IHN1cmUgd2h5IGl0IGZhaWxzLCBteSBhenVyZSBDSSBwYXNzLg0K
PiBJIGJ1aWxkIHRoaXMgd2l0aCBzYW5kYm94NjRfZGVmY29uZmlnIHVzaW5nIG15IGxvY2FsIFBD
IGFuZCBydW4gLi91LQ0KPiBib290IC1kIGFyY2gvc2FuZGJveC9kdHMvc2FuZGJveDY0LmR0YiBX
aXRoIGNvbW1hbmQ6IHV0IGRtDQo+IGRtX3Rlc3RfcmVtb3RlcHJvY19lbGYgSSBub3Qgc2VlIGZh
aWx1cmVzLg0KPiANCj4gTGV0IG1lIHJlYmFzZSB0byBsYXRlc3QgbWFzdGVyLCBwdXNoIHRvIENJ
IGFuZCByZXRlc3QuDQoNClN0aWxsIG5vIGNsdWUgd2h5IHNhbmRib3ggYW1kNjQgcGFzcywgYnV0
IHNhbmRib3ggYXJtNjQgY2xhbmcgZmFpbC4NCg0KTW9yZSBhbmQgbW9yZSBJIGFtIHRoaW5raW5n
IHRoaXMgbWlnaHQgYmUgY29tcGlsZXIgb3IgZWxzZSBjYXVzZWQNCnRoZSBpc3N1ZS4NCg0KSSBh
bSBub3Qgc3VyZSBob3cgdG8gcnVuIHRoZSBhcm02NCBzYW5kYm94IGNsYW5nIHRlc3QgYXQgbXkg
bG9jYWwsDQpJIGJ1aWx0IHNhbmRveDY0IHdpdGggYWFyY2g2NCBnY2MgYW5kIHJhbiBpdCBvbiBp
Lk1YOE1QLUVWSywgbm8NCmlzc3VlLg0KDQpJIG1heSByZXdvcmsgcGF0Y2ggMSB0byBhdm9pZCBp
bnRyb2R1Y2luZyBpb19pb21lbS4NCg0KVGhhbmtzLA0KUGVuZy4NCg0KPiANCj4gVGhhbmtzLA0K
PiBQZW5nDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpV
Ym9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby91Ym9vdC1zdG0zMgo=

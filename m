Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9639BF48D2
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Oct 2025 05:54:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77AD0C5A4F1;
	Tue, 21 Oct 2025 03:54:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23AC7C57169
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 03:54:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aK69GFacDxX6AO6CyRxuCLd+jxl0/crUxc8cPPrszfNMgm55pBat6zrJjayWfRtgSOpbgt/yzf9yll4D3cB5cV2jU58RwNH8h59bXutzGrrTdELJb0pO8mQE3xJGQ3VqdB9CQXNPwJtYQ80ZPwcnRvqLFCmkLv2/fTlmipV0nTGaoqGXiUCVu8tFdet0rA85abDUjhQOEtK6B1GNbcokGN75uoT4EqqoX+ubPOgyZbu8c3NS940kH80KWo56zAUtdq2VZIbDxevx9FZWzp+Lfdk6opeN7RQ23N7HodqROMfNKS3eoJunoCJbLmPhO+3bZFs2y7XeR/vtArdusyPsFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mITTofebJsfFP+owm7DaQ72LLDtpnQy1ufhxzBts4fc=;
 b=pGqgbSUp/09WsPyvGwHKC8CTBA8ePwGPLR19vC3bSct/YLvde8zo8mRLqd4IZFezJXWmxZjH7BmlO+1kBb4JbpmInGUVN/CWAT//kzoN5myldi6kMKOxx1Mib1cdwYfv3EMGt4G9z6YfnppQEcwZVtNra7Xw+VmIrBcuY1KJzSYoxoMjB+o+nt05ZYy52sTXSLfqfyoV+1180OXYP+i+IMHQ2s3PQWvz7ffg8ycbdCidjpNymzES0e1fTI77RrqohxnXRLHpoC6vQ0dgWapfNPc3812UOdAOyszdiVIAEhe0v9a1auCExBs4L8iJX4p1BLSulZk6apYTk+mCkv1Euw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mITTofebJsfFP+owm7DaQ72LLDtpnQy1ufhxzBts4fc=;
 b=atyPwSzUPu+WILsyV5zkaLJN3XD5F0K+GXFYTL3WjkZXDtQ0SmcOXaYs2KCeak9UJ8vtt2DJKbM3/aoEiZdyBLZ6B7RaxklRrYNeaQvWHOsckgWS3hc0BkOm9hQmd5WJbI1s19fDpmocKss+jrnolLWj3osIiOaEJlV60ewHIBZqLEtE/ep7XH0vJ6a2iSeqSkSSJgRA1d+/Pv6zP8fgzDpQF++4bUpoIuvqQLqCxEIg16SUMTzbk1B18iwNqE7j2BL1Ueo5Xzrx+iYA2zO8AxYt8YorhVs/m/6HHYK4wQlyYylUPNBfeNv7ymWb6kuekly6x+eyLI765qKulG+0Bw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9802.eurprd04.prod.outlook.com (2603:10a6:150:110::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 03:48:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 03:48:40 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Fabio Estevam <festevam@gmail.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Thread-Topic: [PATCH v2 00/10] remoteproc: Add support for i.MX8M[M/N/P/Q] and
 i.MX93
Thread-Index: AQHcPXnzcXnn/lry7UuR6erj7TNtmrTIW6cAgAOkU0A=
Date: Tue, 21 Oct 2025 03:48:40 +0000
Message-ID: <PAXPR04MB8459668FA5BE2ECDF55F955A88F2A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
 <CAOMZO5B8cT0NPSAtu7pxODiy_=8PD_aYWW1U7+fs_xLJP8cKbQ@mail.gmail.com>
In-Reply-To: <CAOMZO5B8cT0NPSAtu7pxODiy_=8PD_aYWW1U7+fs_xLJP8cKbQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GVXPR04MB9802:EE_
x-ms-office365-filtering-correlation-id: 79389ef3-08ec-4da0-24ca-08de1054b91f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|19092799006|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bGhUVEZRQkh5M0xWYVRXS0RSRjZUOVBtcFhsM2NsUEF5VDh1NEkwYzYrTHZQ?=
 =?utf-8?B?blA2TDhqZExMYmtray96Ykc2ZWh3Slc2a1N6Tk1FMWZDWnRsZVBuQUZibFcy?=
 =?utf-8?B?bFI4RUFiNlhpQW9CNFdRN0dvZ1pKVDEzUEw4L29BdDcrbWs3T1hOaCtGSTVR?=
 =?utf-8?B?Y1YxTkJ4dHN4NkV2eURISjhNY0x6MEQ3TmpaVGZJSFhubTF6ZUJ3QjdrNTUv?=
 =?utf-8?B?ck1UanVKV2RJS1VvOERkNGJ4VG9pdjV6OEc5WHRUSkF5Y3hIRnpSTFh5TCtM?=
 =?utf-8?B?OG9JQm1PWk8wRzYvQ3F3Ky9PRHdKaFM1WnJHVytLTVkvdWtTbVVESnBIS3My?=
 =?utf-8?B?bS94UlV0am43Nnh5cVpCT2svNUkrcDdvdmU2ZFpYRkl6Z1RxSDZVQ1NrY3NN?=
 =?utf-8?B?TlhiUXBiVzRVeEZoR0xxVkhia0p1NURldjZzNENJMnNhVHpvL3dmOFg4L0Nl?=
 =?utf-8?B?SmFDNCsybU5PL0JuR3phdXd4ZWFpTTdGaHd0VlljL0VQYmZQUklXa2ZmMytW?=
 =?utf-8?B?UkhwWlVRaEFkeWt6QzZBalF5bW9rOU5XSWxHNVdWOGZ2MTJUTEN3Sk8yS3pa?=
 =?utf-8?B?Y3F2QjNPb3lSR01GY1JsRHBTVGNLRXErMDE3THFnakVuYUtxcW4yRm5nZU9C?=
 =?utf-8?B?TnVkMnhaZlNvSm1vN0kzM281YXljOTdiQTQ3eThuelZrVWFsa2Qvam51V2JE?=
 =?utf-8?B?d3NSamF0OVY4YkF4dkZKbXg1WFdRRUpFWVl5ejk1TG1aSXNKL29VZFo4bmVz?=
 =?utf-8?B?TFBFNWFIRVIvYWd0R0FDKzBmUndUNmFoK2ptQ2ptVnNPVVdtSGRwZUt0UXdk?=
 =?utf-8?B?SjNCZ1Y0c3pWL3BqamJsb095WjZNeVd3SXRad2VNTGk2KzQzTE90d0NJY0R5?=
 =?utf-8?B?T0lxUTMxd0g0SHk1ZGpyckRTOEg2SzlON0NzL1k0Z2xxZ1VnYi8zZ3M1dFdx?=
 =?utf-8?B?a1RwcWpjN1NPdSsvMGxaL2x1YkRJY2JkM0JyYzNPbVZ5ZVpTNWZKUi9OUnI4?=
 =?utf-8?B?WGprQ2F1WVlTVWJQcTNEdm1FVnRydC9WdHQ3RlNXRzFaOGJ5R0U3cW5nYjNj?=
 =?utf-8?B?YTF4NGFrNWF3UG5wNVdxUjJGUG1EOTZETmVYTzZMSE16L3E5WDIzNzFzZmJH?=
 =?utf-8?B?U21ySk1uV0lSdFZNQUZFM3p4VGFkUnBDTm5lTDVmSTB3OEluZG1pWmUremJv?=
 =?utf-8?B?RlBabndpZU11NEQyWmljSGlkUzZvRXBCMHdtdGlCWFV3ZjM4N2RsenMyQ1VI?=
 =?utf-8?B?NXRnUDRQYXNlUXZKazJvM1YvNCtrYW8yS2xBeUtoNFpQblhkTXNsOWd5L2NC?=
 =?utf-8?B?NE04VzJLT3dSNlNkbDNTdmVtTWNwRlVUeEVLMEw3YlFra3lsMlY4eXlQODNu?=
 =?utf-8?B?V05XZlhoVTNrTmVEV1VMenNXaWxPSHZhTWE1Qmw0WFBJK2VoQ3AvNUZaeFBo?=
 =?utf-8?B?ZFNMNXlSbzRaWmlPQ3JrekIyQ014Y3E4Q3czWWJ4bFFPTVYrWFh2TjZPME93?=
 =?utf-8?B?cnNWK0F1akNybDRJS21jbTFWVVhMeWJ4Z25EZnlMaXpUVXdwWVNOeHZjN1A1?=
 =?utf-8?B?VWJUNXVCRkJGK3pqVU0zNjB4NUlRNWlRUkUxcVBBVFZBZnJyOTQrUjJXbHU4?=
 =?utf-8?B?azJ0UWlaZVZQS0E1bjlpMW1ZeCs4Uk5pZ24zcjVrQ1creXZKZTN6dFEvN3lw?=
 =?utf-8?B?OUNaYnozQk5GVDh6ZmdMa3BFdzd0UEg4dzNLb2JvRDVCTkZYTlNsUlVXSlN4?=
 =?utf-8?B?ZHMxT3dpb2R3Q3FTUFlackpxNVMwUzIxbWpoaElDSFlXdVlOUlJnVXp5Q2Rh?=
 =?utf-8?B?aHRBRTA2MUxCSFU3c2gySFJhenFUalRrZi9BOXBTYVBxWW1VdG9wL2NTV1Iz?=
 =?utf-8?B?TnZpTm1xRkh6S0x5bFhIRXFaRVU3SUduLzhNOEFnQkRLL2VUNWUwTFZhazN0?=
 =?utf-8?B?ejBOSWJaU0VpTEpQWDd6dWc2dmVEM2ZhODhIOTVnZy93bWdrZ3lRUnI3VkJy?=
 =?utf-8?B?Tno4SkVkekg2YmxEQlFjV1dHcXdtdTJjblhDVE10SVFoZG9kWCtJTk1aMUp4?=
 =?utf-8?Q?I+FQ/O?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDNqb3ljWUtBUHNyYkptUDEybDcvUlJqdkVkc25DOXNFc0lxK1dTbHJ5TGFa?=
 =?utf-8?B?OHBnVlpUb2IwRHR1TzBSUGZlaFg3cnY4ajZucC9oRk9XM0tOU1MwTWNyR3dD?=
 =?utf-8?B?Tkk3U0JWU2NwTHo2N0lnV1FLaitRc0NtaFFOREc2QnQ1VXVTMythRVhTUkd1?=
 =?utf-8?B?SFUyME03ckN0Qzd2a1hUNEJtQUp6NXlqM2lDWGpSNTYzV3djaktDVUpiRnRa?=
 =?utf-8?B?SGcxUDYwOXZGZjBMQXJndHVQRk5lQlJIRlNNSDdZYVdVN2tJK1JNVEpzMURl?=
 =?utf-8?B?WnErRDNFNUw0eU1OMU9WOEV0MklGWWROdzZGRGNGdk5ZbUpSRlR6ZFlqcmRJ?=
 =?utf-8?B?Tzl6V2crWXp4bHVta2pwM1ZXUW9XeWRVbVAxbm9yZTRsU3lRQWN5MHFPZW9q?=
 =?utf-8?B?RlF5TlNXUzM1WVpBUmdwRlk3U1k5TWsxNVNJTG1GY0FkcjRsQ1BlR1BHTEdJ?=
 =?utf-8?B?b3VEdXd2aEJMUkk5SlBsYnkyaFBxUG5KeE1lVTZJeGZwRGI3MDE3OWdIa1lU?=
 =?utf-8?B?NFk1akhqODJjRnJJT2dHaTNHcG9uWDF5c0dIOFhERHlJbnJFSVBaczNVWjlk?=
 =?utf-8?B?QmFvTStxMVIwWXBvaU8zalY1ckc1S0JJbXAwbkpuTmJDV2NMUzJHRDcxVm9D?=
 =?utf-8?B?WUhKM2pXR1c5NFFlWXRpZnhheStHTSsxM1JUTHVIV1JsQjFXKzhSMmlwbUMz?=
 =?utf-8?B?SEYvUTlNZ0pjOUs2WEZIaDNoaUtha3JhZWR0M01aVFVnZUltTmMyaDNVcEVn?=
 =?utf-8?B?blRHbzRjb1FCKzU0d3FHS01XQ2haSE9JWjhzenVVQndSbnhOYUJMZDFOMzlC?=
 =?utf-8?B?bFdpalhFMTdCTHQ3WkVET1R2U1crQkNtZVFlTUJNTktrdVI5UER3bDJXZjdD?=
 =?utf-8?B?MVQ3eXRJOWR5ZUU3OXp5ZXE5bTFDZFhTbjh0bkVCaWhEQVFSN2RJMXdYc1Ry?=
 =?utf-8?B?TXdpRGk2TitkSHhGNDgycGt3SWRwVDVpbzdLSlIramliNGNWT0M4VlBsOGZy?=
 =?utf-8?B?S3E3dnp6UEd6aWp1K01SQ3dVUWc2eXFNcmh3aDVUUm1yM1NQeWIrVjhqVGRL?=
 =?utf-8?B?MkRkUVRWeHhQYnZKNnFjNGVITS96OWZ1SUJ0WWtLYjJvdEFERlVQMTFoSFFX?=
 =?utf-8?B?N3dmT1BsUkVMcDZEVDdwT2h6a2NUMjdUS1hjZmdEUXpZWXE4MWZVanRVamNh?=
 =?utf-8?B?aHpSQy94a09EZS9XVTFJenpKd2ZDdHE2bWxuRHFZYVVKRzNLcUZrMkJMY21h?=
 =?utf-8?B?VUxtMzFCVWhiZTV3SVRlOXk2TmlKV3hFTTN3Yjd4d05CRnpZWDRNSXFhaEVm?=
 =?utf-8?B?aVdqRUF5ZlBSVGZhbjM5dVJDa2EvLzN0blByNjdIMjA3cTFvR2VETXA0NDBM?=
 =?utf-8?B?WmdmMEc3TTVFb2w2bUJnWi9rd1BKZFVScTNVbkpMV3lsbVpRVmx2MHpQN2hL?=
 =?utf-8?B?bG9YNFU4RnU4OWZYZi9LcVpMelhScS8wTVJpbkt2WUpJN0U1dnNiMTAxM285?=
 =?utf-8?B?UjJ0SUhvZ3YxbThYcHYzVTBCSCtVNXRXT1pKc1c1aVBPWTlGTDNacWdGTUh5?=
 =?utf-8?B?R3dvKy9UWWRpRE95U0k3SzY4dHA5QTZNWFl3UkxKUDAzNnRmdTlpMXhibWJI?=
 =?utf-8?B?S1Y3bmRNYVNHTVZ5THZTY1J4aXJhNmZrR0YvdUF2M3NWVXNHMjVkZ2RRMldp?=
 =?utf-8?B?am1Qb3JrM2RoY0VUM3VpalN4Z0pHZThNd1lzdktmcEkyaktNOS9PdlJtSWxk?=
 =?utf-8?B?RmJNUmM0U1dNZmxQVlkxc1I5NURhbjZxTHl5Z3VwZnd4OFM5anA4K1RDK1Jk?=
 =?utf-8?B?U2c3c000aGVLd0Mya1MvbHo5VzJGYlplSlRIUjEvUlFjbjl3SzVHaEFjYm15?=
 =?utf-8?B?cEhkazNMZVBlR1VNYTUzYVZJdzJKbmtQUFN0RUFQczkxUXNhcnpWdVFUZ3pS?=
 =?utf-8?B?TDFLWnFUY2p6ZzZIdGJkcm5oS0loMUlITVN3eDlzc0JHMEpaQUZVZS9MUFhF?=
 =?utf-8?B?ay9ZYTlIc3VPN1lVZHJ3a3NJaU04L0FWZVRGUE44MnMrZ1p1THRTRWtNKzRQ?=
 =?utf-8?B?UXVDZU1NdE5qWHFaMlBFaUkxQUhNd1UvYjRGVmNHNXEvZGtxRlJzSUFaeHZq?=
 =?utf-8?Q?dTgM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79389ef3-08ec-4da0-24ca-08de1054b91f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 03:48:40.1856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rB8csIgA9B50EjN1CL5sQRRb673f3rJj8gZFaou//uLUatcXeuMQQeVR4LC7Y0ZbWeJntEjFhILtBHi0WMSUDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9802
Cc: Tom Rini <trini@konsulko.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Andrew Davis <afd@ti.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 dl-uboot-imx <uboot-imx@nxp.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Hari Nagalla <hnagalla@ti.com>,
 Ryan Eatmon <reatmon@ti.com>, Stefano Babic <sbabic@nabladev.com>
Subject: Re: [Uboot-stm32] [PATCH v2 00/10] remoteproc: Add support for
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAwLzEwXSByZW1vdGVwcm9jOiBBZGQgc3VwcG9ydCBm
b3INCj4gaS5NWDhNW00vTi9QL1FdIGFuZCBpLk1YOTMNCj4gDQo+IEhpIFBlbmcsDQo+IA0KPiBP
biBUdWUsIE9jdCAxNCwgMjAyNSBhdCAxMToxOOKAr1BNIFBlbmcgRmFuIChPU1MpDQo+IDxwZW5n
LmZhbkBvc3MubnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBpbnRy
b2R1Y2VzIHJlbW90ZXByb2Mgc3VwcG9ydCBmb3IgTlhQIGkuTVg4TSBhbmQNCj4gPiBpLk1YOTMg
cGxhdGZvcm1zLiBNb3N0IG9mIHRoZSBpLk1YLXNwZWNpZmljIGxvZ2ljIGlzIHBvcnRlZCBmcm9t
IHRoZQ0KPiA+IExpbnV4IGtlcm5lbCB0byBlbnN1cmUgY29tcGF0aWJpbGl0eSBhbmQgbWFpbnRh
aW5hYmlsaXR5Lg0KPiA+DQo+ID4gVGhlIGV4aXN0aW5nIGJvb3RhdXggY29tbWFuZCBpbiBVLUJv
b3Qgb25seSBzdXBwb3J0cyBsb2FkaW5nIHJhdw0KPiBiaW5hcnkgaW1hZ2VzLg0KPiA+IEhvd2V2
ZXIsIHRoaXMgYXBwcm9hY2ggZmFpbHMgd2hlbiB0aGUgcmVtb3RlIHByb2Nlc3NvciBmaXJtd2Fy
ZQ0KPiA+IGNvbnRhaW5zIHNlY3Rpb25zIHRoYXQgbXVzdCBiZSBsb2FkZWQgaW50byBib3RoIFRD
TSBhbmQgRERSLiBUbw0KPiA+IGFkZHJlc3MgdGhpcyBsaW1pdGF0aW9uLCBuZWVkIHRvIHVzZSBy
ZW1vdGVwcm9jIGZyYW1ld29yayBFTEYgbG9hZGVyLA0KPiA+IGVuYWJsaW5nIHByb3BlciBsb2Fk
aW5nIG9mIHNlZ21lbnRlZCBmaXJtd2FyZSBpbWFnZXMuDQo+ID4NCj4gPiBQYXRjaCBTdW1tYXJ5
Og0KPiA+DQo+ID4gUGF0Y2hlcyAx4oCTMjogSW1wb3J0IG1lbWNweV9pbyBhbmQgbWVtc2V0X2lv
IGZyb20gdGhlIExpbnV4DQo+IGtlcm5lbCBhbmQgZW5hYmxlDQo+ID4gICAgICAgICAgICAgIHRo
ZW0gaW4gdGhlIHJlbW90ZXByb2Mgc3Vic3lzdGVtLg0KPiA+IFBhdGNoZXMgM+KAkzExOiBBZGQg
cGxhdGZvcm0tc3BlY2lmaWMgcmVtb3RlcHJvYyBzdXBwb3J0IGZvciBpLk1YOE0NCj4gYW5kIGku
TVg5My4NCj4gPiBQYXRjaCA2OiBUZW1wb3JhcmlseSBhZGRzIENvcnRleC1NIG5vZGVzIHRvIHgt
dS1ib290LmR0c2kgc2luY2UgdGhleQ0KPiBhcmUgbm90DQo+ID4gICAgICAgICAgeWV0IGF2YWls
YWJsZSBpbiB0aGUgdXBzdHJlYW0gTGludXggZGV2aWNlIHRyZWUuIFRoZXNlIG5vZGVzIGNhbg0K
PiBiZQ0KPiA+ICAgICAgICAgIHJlbW92ZWQgb25jZSB0aGV5IGFyZSBtZXJnZWQgdXBzdHJlYW0u
DQo+ID4NCj4gPiBOWFAgaW50ZXJuYWwgUi1iIHRhZ3MgYXJlIGtlcHQsIGJlY2F1c2UgdGhlIHBh
dGNoZXMgYXJlIGRpcmVjdGx5DQo+ID4gY2hlcnJ5LXBpY2tlZCBmcm9tIE5YUCBMVFMgdHJlZS4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiAN
Cj4gUGxlYXNlIGFkZCBkb2N1bWVudGF0aW9uIHRoYXQgZXhwbGFpbnMgaG93IHJlbW90ZXByb2Mg
Y2FuIGJlIHVzZWQNCj4gb24gTlhQIGkuTVg4TSBhbmQgaS5NWDkzIHBsYXRmb3Jtcy4NCg0KVGhl
cmUgaXMgYSBidWlsZCBicmVhayBmb3IgdGlfazNfbTRfcnByb2MuYywgSSB3aWxsIGZpeCBhbmQg
cG9zdCB2Mw0KdG9nZXRoZXIgd2l0aCBkb2MuDQoNClRoYW5rcywNClBlbmcNCg0KPiANCj4gVGhh
bmtzDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=

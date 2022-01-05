Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0752484F94
	for <lists+uboot-stm32@lfdr.de>; Wed,  5 Jan 2022 09:53:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E3C4C5F1F5;
	Wed,  5 Jan 2022 08:53:11 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0625AC5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jan 2022 08:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1641372789; x=1672908789;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LriuPk02oI8rZHUXnfk5U/BFLqvopEFh94ZRQ68h7cc=;
 b=SJ5Flb9AjKXoBrTDMcTH/Jcd7g0qQebX8Zt7Q/QyNdEz039H13LNU9Rr
 6nO+Kt/APKkl4hnY1dzRcjzZUMfE3rxOL/U/XRkENRW8jHxF0oezd6UrS
 OSjPq/j52imqH5vgFSe1R9zMm3wyelzXHu1sh+IrtTkvrKAXn6WTlddCL
 UswCLpMu8y8wopr0Uw3ZaE6DRaEOlf45Hx0iivFTJRHDIUTijgbjeY4xO
 VO6CQuvUau3aeHRTN/MeIoEKszhVDmFf+KNMtypjXime3xu4ZaVoO2HIj
 sFwwPTnX4Jyw7SY0RTnEZ7lAOl44i67Ecjs0SJbVVv/Z9ROCtoXV0UrN/ g==;
IronPort-SDR: eDCgsOJhVyGTdsG/Z8i08HsDTB/SPfZLI1OkYRPmBafFhCAzdp3ID9+XrM3yAAsSkJli3Bq2Ye
 S34l04gDr063tfiyjiVeIH0Hek6kBRWkvlgu7zBDivAiz/Fs8JEf5puHuz9hPwu1HpG+zcgaiw
 cTM1kdVpB8+vr6S2V7pqLZsFFakbREUFd9bCaT+di5QFxXHU4t2sPrb8F2eMEAOx9VZ2TyR0QX
 n48JpJse2CCCE3tthrnt8sKtdu6dTb7cD4eacTQ8Yj6JeZ/N+ryNZoJ7l5KvMdtF9J83tiid3i
 5i3eIeM2ttvWS63RzW6R6gFc
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; d="scan'208";a="157572130"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Jan 2022 01:53:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 5 Jan 2022 01:53:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 5 Jan 2022 01:53:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZrBmP2gZYoz98/eC5Sbj3SoAF+mThY9dbMwV5z9pQpERPnawviDPQ+lyajjM65E3IuznTnl47ENVf3QoiSaQi8F8Iqp6+1kTX0QZs7JPuIejo70BwGJ5lSlAzOyUz2oaAVEq1kBpds+eXuL/OlDNYvWmCdx1pWhUPrGdZ54eSfswxDGrqPGjbKyNY9Qj13J+I+acCvaMcarBOPKImFzeL+BDSJXXyx9qF7SftVXnJba8ZuUuR/xaYoqwCNTU6xTZmf5ytFJVzIZCXGS6gqR6vB8W6hB2UUnWWK6QHRcVk2vkVYCqPHqWqyxw2YJAgQbeyYhxXtgabNVONWBjPQr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LriuPk02oI8rZHUXnfk5U/BFLqvopEFh94ZRQ68h7cc=;
 b=OASVIleg8d5c9trQYrnNay32tSJVjRp1T7iaks0+jqlRzdUq3BGBZqUqU7+oPOpOgkoIiUs7OOTcLRkUH8aDEynQ6LnwaRo1kjZPu11WCVtz94Apl3sHc1tDQdlEyfmQ1F0JflhCFPz7WPZMQbpfa1xu2Anlc0zAqID++b7XofRx5fp5QNljT3er14mE98MuV3F1x1Vx8y14aNge4ZQS0sN+bwJy/vEPOc4+cSPDzRh7RVyX5OA3EIGf9fUCu8cqLqKbNArTZKyj8EcG00iDwjJRnBmZXzrlSMYr3mCtS3ySk0bC1ld+Qa0RVd56yOqQV3P6JifH2PSAEa2QHmE15w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LriuPk02oI8rZHUXnfk5U/BFLqvopEFh94ZRQ68h7cc=;
 b=p443uj3qg3cpjo09B5VwPJYowxVcqVcwMQNXf62TVrkW9qaMV3Q6ejAbfPVTYFX7XfxXXx1X/Zn+xhvhqIq5FW9pLftYfI8wDMC2Eef02C60Q8HHeQlrjH7LS2aMCs9X2I9hqDS8YHVAp2Oi+IeauKQP4bCo+t1EuhrcfPXYAYQ=
Received: from PH0PR11MB4920.namprd11.prod.outlook.com (2603:10b6:510:41::22)
 by PH0PR11MB5061.namprd11.prod.outlook.com (2603:10b6:510:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 08:53:05 +0000
Received: from PH0PR11MB4920.namprd11.prod.outlook.com
 ([fe80::d7c:834f:4591:3c0c]) by PH0PR11MB4920.namprd11.prod.outlook.com
 ([fe80::d7c:834f:4591:3c0c%5]) with mapi id 15.20.4867.009; Wed, 5 Jan 2022
 08:53:05 +0000
From: <Eugen.Hristev@microchip.com>
To: <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
Thread-Topic: [PATCH v1 5/5] Convert CONFIG_AT91_EFLASH to Kconfig
Thread-Index: AQHYAW5q7odUsBvla0CBmKoWgojg7qxUHgsAgAACZQA=
Date: Wed, 5 Jan 2022 08:53:05 +0000
Message-ID: <e5cf44d9-05dc-9b32-2b10-c6ba749451ed@microchip.com>
References: <20220104132401.3573475-1-patrick.delaunay@foss.st.com>
 <20220104142328.v1.5.I5fc8065d06afb12c358588f9078ba15b1cbbe94c@changeid>
 <5a8697e7-e2cc-7988-9496-06a051fe0ef6@denx.de>
In-Reply-To: <5a8697e7-e2cc-7988-9496-06a051fe0ef6@denx.de>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8f78d95-361b-46ef-c2ac-08d9d028ca0f
x-ms-traffictypediagnostic: PH0PR11MB5061:EE_
x-microsoft-antispam-prvs: <PH0PR11MB50615045603E52F5F1A31D1AE84B9@PH0PR11MB5061.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t3Pp8gDjbh8G/Bg149kIE63YH04hDOsVudgOnPhioN4Ae2nWLkS3w+xmXQ2IUM/5EfmJBlCWwajvDGeWN/Sjk55h6VgB3e3Xt518lZhjP2c/RRxa6s265J0F3H+hcPw24oiDsFhrcIBvyn7NddpABOJx+chOnYVq86OMYEsOsJFnpyEWpZOtUNxlDq4SKV4aghN+DuYe3Uq2OICS6iAC7AVQklANlieY/ptFOTKI9lkfz1JwOsKUESyUepf0UQLVn5qk0UW2RBWLSdPn/Udopz5lLX/ha5jHTPbPNGeK6jjTHdQ1rDmLenCDjl8UQURArdPDc3TTEUqXLSTJZ97MmZqFSXGQy7Nz86A5tVK03MDExakI1EFeF1FaGVI9wJIkyeNKVckW/z53qzQ6XyUdPfNHFfFP+OIMmCd6v6lMbaHd/iEHhcHEQ4rN7/c9ZGb0PUwXnVLHdWVFnz9ltS8le6HDKhBk9gg0Q33V26RJtAjkTf95J1Q/x5yeOOH8CdHOWkW0GyegXy+/ZZleyKW+vt/GIWWYhsNdvxLOoZQnCgHWLvrX01cGvLWy1VLy326YmMpmnmGnk27WcnNGYudzZ6i+4iY/D/d4AYcPbosedxRCw4fuZxi04yIJKZs2HZs7l2wn/yk0ddAGH4eWZv6NTVbQNHbFzQwE/jb16BkwIDByarYN578JIYmNZJM+Dl1P7YZBfKyeuPIvmGh1/HZBosfRyo/Tk06fl9+XXw4MIHjr0k+sK7KEjaqGoffinNZbuNLIjMeP2Llpc5BrXxrF8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4920.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(8936002)(8676002)(36756003)(71200400001)(110136005)(54906003)(508600001)(31696002)(91956017)(5660300002)(4326008)(316002)(2906002)(66446008)(76116006)(31686004)(66476007)(38100700002)(83380400001)(66946007)(26005)(186003)(66556008)(53546011)(6506007)(64756008)(6486002)(2616005)(6512007)(86362001)(122000001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVVBdFRYc0gyK2pGMmYrOGwzdDQxVnNpL1VDa0kybVF3U0tJMDVvQ3hOejJa?=
 =?utf-8?B?UTBOUVozU0dlMVhvTy9NMmMzemRZeTV0WmxzZzkxOVRRMnN5RlY5cjRIMnBM?=
 =?utf-8?B?bXRGUzB3WkhIdm5UQjBKcEpOYWZiSnl2QjBxSFZFTUlTU3FQZHo2RzN5K0lT?=
 =?utf-8?B?TWlnajVRdFNGWmF2THJHVnluV3FobVNrbUQyY3VMMHlHTjZ6R1huTnRMWXpt?=
 =?utf-8?B?eVUxc3hFTnJZd2pHTW9lVlVkZXJKcFJ1dXg5cTd6UHV5WnN6M05zT3NtNWE0?=
 =?utf-8?B?Y0RqbE1PSTNlTW11Z3pFMXdhUmk5QUVINllaMi9adUZTZ04wNVhqZEpBUGpG?=
 =?utf-8?B?MnVOQWJuamMvbUJCZU9OUG9wWm40Q0o5VTFkQVZtY2pYTm51R255alVmcFdY?=
 =?utf-8?B?dnRuc2MxL1NONXpiRCtpSzQwazAwNFhpM2JZMXdTT0Z2WVlTY09GMzlkcExQ?=
 =?utf-8?B?UGF4YnFlcTFWaTgzZzV1dFFISEx2cEhZbHBSYjRFM1RTcXZTTkdHcGdabjFM?=
 =?utf-8?B?eVFjQXQ0cktFNmdtVFF5NTRubVlLc0tVZjBqRVdzcUVhbE9SRnZQTjlqT1k0?=
 =?utf-8?B?Y1loNjVpeWl5c1FadlZibm0zTFlhRXN4Q3BzbzMxRzd6OEx2WE16c3g5aUMy?=
 =?utf-8?B?S253RS9RaDF2SnZ5S05RZ0dIL2pyMWpYeDgxb2dFQ1RXbnNESnlvVlFKeml4?=
 =?utf-8?B?WXU3VlFDYVgxdXlGVHBMZWNiREtWbXUyTnQ3RUkwYVdqdi9xSlliZ0tydUxX?=
 =?utf-8?B?dGJ3ZHNDcjQ0SFpaZ09ZbU5CVnM1Q09tU1h0OGxjcm1WUUNsMHlRcUpZRFlo?=
 =?utf-8?B?ZnpFWmgrd21aYWdTMTRxajZIMjllVWc4bWR6cGRTZ2JKM1drMEpUdmVpaWhx?=
 =?utf-8?B?UFh0WmdYeDM3UmZoYjdMRFg2QTByZWV0cVNwU3c2ZW44QUNpdjR1UGRJblpj?=
 =?utf-8?B?RTZUYldQK3J3YzI4UE51bEdsRVI1Wm1DNFk2TFV4SUtzSzBmYjRxMEx2YWtG?=
 =?utf-8?B?eDFZL1kvd2RnV0cvUzYvbFhtTVJMUDlNcG1hRlZocm85amR1TG43TkdieEVU?=
 =?utf-8?B?ZmZXZjhhOXFZakI3d05PaHNlbUorcGxNWGs4Z2V1UzNncGFFQlF0Wld4N011?=
 =?utf-8?B?OXFCaGQyLzk0UDFyK281aEd4bFJydzFMK3czSDNLNmZNajd3cS9PRk5vOFN6?=
 =?utf-8?B?S0JsSFpyeVFqVUE5dmJPZ0t4RkkxNGtaeUpLWG5LV0UzWHNFcThJODhQYUdK?=
 =?utf-8?B?RklxNDZFTHl3c29paHo4aDJJME1KMHUyWm1lZ25OVk1jMmxIbTlCeW9BRFZH?=
 =?utf-8?B?NlpMSzZjVnY1dEEwcEhZdUwzOHI2a1VXVVpOaHdkMmJaTm03dENZZkV2a1lj?=
 =?utf-8?B?SFBiTk5qdE1WRGhFNHZLUjNMZjVtWmlpTkYrSTRpOGg4V2crc2FBZHdFQ20v?=
 =?utf-8?B?aWlIUHY3dUVkYVFDbHpyWGg5d1hvZ3R0MnhvTkNQOG1VMWhDK3VTQzlaQTR1?=
 =?utf-8?B?d0t3M2FNaXJuelZjbkt0RXJzb2ZwNGZUaCtsRVpKQUl1c2VRQ01QRy83NTZX?=
 =?utf-8?B?TElhWmF3UUlpODFoUjFYRkhyaTM3aUZxZ2t0dVRadUdGTHB3Sm9Ca0dGOXpw?=
 =?utf-8?B?eVlEMEJVVVVzb1BCNjVzZnRHQjAvR2JRWDQ2Y1ZzUGNkZTAxRVhHWnFGNmpt?=
 =?utf-8?B?MUlVWXhoRzA2UitDdnRlMWk1OFUyQzhPTHEzbVJQcUVYbmtlVGdQdXFGOGw5?=
 =?utf-8?B?cUZqdlJBSFhiSm0vdjNnM1paRmc5UUhwVGdWOGFNREJWajN1MWZOM1BQczVM?=
 =?utf-8?B?OGoxOEI1OGRzeGkxUnJQTEVtdzloWFIzaksrdUVhUUpZQ0lvYlUzUEJ5a1ZI?=
 =?utf-8?B?bU5VSmkwZ0VHcko0L1JRbEJISWw4V29xQWNzeitmTWUxSkNxQlliZ0t1emJt?=
 =?utf-8?B?NEZJRFA2ZWRlM3RYSmU4RE5lTmZhY2h1M2pGNDJvN0lTOXFzRit2TXVQQjkv?=
 =?utf-8?B?aUFCcUYxRmZsOFBzM3huc3kvbFdpaTN5MFVFMkNHTnhsVVdFWmpqZDVBZXVN?=
 =?utf-8?B?ekdVejZYYTNQTjNXRW5qVnRCMkRPckNETGRpWm9xWC90U055WnhxN0lYVkk1?=
 =?utf-8?B?b1ZtTzhFQ0JWZDdIWFJXNlR5Z0dvTkxzU2g3ZWl3T2ZsSkVVQUtqV3VpcURm?=
 =?utf-8?B?dkRaaElhK05FQ3JQZis0bXZxa3gzOWMwSW8zcHdOS212MnVUQitqSk9DNjB6?=
 =?utf-8?B?QWNrNzNBYTJZUDFNWlJlZVpwdkh3PT0=?=
Content-ID: <36E5EB5CD9A2DA41A00E90256C1DE85A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f78d95-361b-46ef-c2ac-08d9d028ca0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2022 08:53:05.6466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nfwrqezNE0wT9flZ9bUV/krl402NcaYTDXVW2D6kEmvS0jRd2GdzTSN9aww/TPKEJRk8/Zni4XsDXvMqOQHRXCrVkxvCubZvmLaNsNGjLHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5061
Cc: marex@denx.de, priyanka.jain@nxp.com, sjg@chromium.org, marek.behun@nic.cz,
 info@egnite.de, uboot-stm32@st-md-mailman.stormreply.com, sr@denx.de
Subject: Re: [Uboot-stm32] [PATCH v1 5/5] Convert CONFIG_AT91_EFLASH to
	Kconfig
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

T24gMS81LzIyIDEwOjQ0IEFNLCBTdGVmYW4gUm9lc2Ugd3JvdGU6DQoNCj4gT24gMS80LzIyIDE0
OjI0LCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOg0KPj4gVGhpcyBjb252ZXJ0cyB0aGUgZm9sbG93
aW5nIHRvIEtjb25maWc6DQo+PiDCoMKgwqAgQ09ORklHX0FUOTFfRUZMQVNIDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNv
bT4NCj4+IFJldmlld2VkLWJ5OiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4NCj4gDQo+
IFJldmlld2VkLWJ5OiBTdGVmYW4gUm9lc2UgPHNyQGRlbnguZGU+DQoNClRoYW5rIHlvdSBmb3Ig
dGhlIHBhdGNoLg0KDQpBY2tlZC1ieTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNy
b2NoaXAuY29tPg0KDQo+IA0KPiBUaGFua3MsDQo+IFN0ZWZhbg0KPiANCj4+IC0tLQ0KPj4NCj4+
IMKgIGFyY2gvYXJtL21hY2gtYXQ5MS9LY29uZmlnwqDCoCB8IDggKysrKysrKysNCj4+IMKgIGNv
bmZpZ3MvZXRoZXJudXQ1X2RlZmNvbmZpZ8KgIHwgMiArLQ0KPj4gwqAgaW5jbHVkZS9jb25maWdz
L2V0aGVybnV0NS5owqAgfCAxIC0NCj4+IMKgIHNjcmlwdHMvY29uZmlnX3doaXRlbGlzdC50eHQg
fCAxIC0NCj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLWF0OTEvS2NvbmZpZyBiL2Fy
Y2gvYXJtL21hY2gtYXQ5MS9LY29uZmlnDQo+PiBpbmRleCA0NDQ4Y2ExNTkyLi4wMGYzMTA0NWQ2
IDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9hcm0vbWFjaC1hdDkxL0tjb25maWcNCj4+ICsrKyBiL2Fy
Y2gvYXJtL21hY2gtYXQ5MS9LY29uZmlnDQo+PiBAQCAtMzAyLDYgKzMwMiwxNCBAQCBjb25maWcg
QVRNRUxfU0ZSDQo+PiDCoCBjb25maWcgU1lTX1NPQw0KPj4gwqDCoMKgwqDCoCBkZWZhdWx0ICJh
dDkxIg0KPj4NCj4+ICtjb25maWcgQVQ5MV9FRkxBU0gNCj4+ICvCoMKgwqDCoCBib29sICJTdXBw
b3J0IEFUOTEgZmxhc2ggZHJpdmVyIg0KPj4gK8KgwqDCoMKgIGRlcGVuZHMgb24gQVQ5MVNBTTlY
RQ0KPj4gK8KgwqDCoMKgIHNlbGVjdCBVU0VfU1lTX01BWF9GTEFTSF9CQU5LUw0KPj4gK8KgwqDC
oMKgIGhlbHANCj4+ICvCoMKgwqDCoMKgwqAgRW5hYmxlIHRoZSBkcml2ZXIgZm9yIHRoZSBlbWJl
ZGRlZCBmbGFzaCB1c2VkIGluIHRoZSBBdG1lbA0KPj4gK8KgwqDCoMKgwqDCoCBBVDkxU0FNOVhF
IGRldmljZXMuDQo+PiArDQo+PiDCoCBzb3VyY2UgImJvYXJkL2F0bWVsL2F0OTFzYW05MjYwZWsv
S2NvbmZpZyINCj4+IMKgIHNvdXJjZSAiYm9hcmQvYXRtZWwvYXQ5MXNhbTkyNjFlay9LY29uZmln
Ig0KPj4gwqAgc291cmNlICJib2FyZC9hdG1lbC9hdDkxc2FtOTI2M2VrL0tjb25maWciDQo+PiBk
aWZmIC0tZ2l0IGEvY29uZmlncy9ldGhlcm51dDVfZGVmY29uZmlnIGIvY29uZmlncy9ldGhlcm51
dDVfZGVmY29uZmlnDQo+PiBpbmRleCA1ZDk4MzE4YWFiLi43YTcwMWRiMGUxIDEwMDY0NA0KPj4g
LS0tIGEvY29uZmlncy9ldGhlcm51dDVfZGVmY29uZmlnDQo+PiArKysgYi9jb25maWdzL2V0aGVy
bnV0NV9kZWZjb25maWcNCj4+IEBAIC00LDYgKzQsNyBAQCBDT05GSUdfQVJDSF9DUFVfSU5JVD15
DQo+PiDCoCBDT05GSUdfQVJDSF9BVDkxPXkNCj4+IMKgIENPTkZJR19TWVNfVEVYVF9CQVNFPTB4
MjcwMDAwMDANCj4+IMKgIENPTkZJR19TWVNfTUFMTE9DX0xFTj0weDEyMTAwMA0KPj4gK0NPTkZJ
R19BVDkxX0VGTEFTSD15DQo+PiDCoCBDT05GSUdfU1lTX01BTExPQ19GX0xFTj0weDIwMDANCj4+
IMKgIENPTkZJR19UQVJHRVRfRVRIRVJOVVQ1PXkNCj4+IMKgIENPTkZJR19OUl9EUkFNX0JBTktT
PTENCj4+IEBAIC02Niw3ICs2Nyw2IEBAIENPTkZJR19TWVNfSTJDX1NPRlRfU0xBVkU9MA0KPj4g
wqAgQ09ORklHX0dFTkVSSUNfQVRNRUxfTUNJPXkNCj4+IMKgIENPTkZJR19NVEQ9eQ0KPj4gwqAg
Q09ORklHX01URF9OT1JfRkxBU0g9eQ0KPj4gLUNPTkZJR19VU0VfU1lTX01BWF9GTEFTSF9CQU5L
Uz15DQo+PiDCoCBDT05GSUdfTVREX1JBV19OQU5EPXkNCj4+IMKgICMgQ09ORklHX1NZU19OQU5E
X1VTRV9GTEFTSF9CQlQgaXMgbm90IHNldA0KPj4gwqAgQ09ORklHX05BTkRfQVRNRUw9eQ0KPj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvY29uZmlncy9ldGhlcm51dDUuaCBiL2luY2x1ZGUvY29uZmln
cy9ldGhlcm51dDUuaA0KPj4gaW5kZXggZDcyZjcwNDYzNi4uZDg4YzE0YWM0NCAxMDA2NDQNCj4+
IC0tLSBhL2luY2x1ZGUvY29uZmlncy9ldGhlcm51dDUuaA0KPj4gKysrIGIvaW5jbHVkZS9jb25m
aWdzL2V0aGVybnV0NS5oDQo+PiBAQCAtMzMsNyArMzMsNiBAQA0KPj4NCj4+IMKgIC8qIDUxMmtC
IG9uLWNoaXAgTk9SIGZsYXNoICovDQo+PiDCoCAjIGRlZmluZSBDT05GSUdfU1lTX0ZMQVNIX0JB
U0XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDAwMjAwMDAwIC8qIA0KPj4gQVQ5MVNBTTlY
RV9GTEFTSF9CQVNFICovDQo+PiAtIyBkZWZpbmUgQ09ORklHX0FUOTFfRUZMQVNIDQo+PiDCoCAj
IGRlZmluZSBDT05GSUdfU1lTX01BWF9GTEFTSF9TRUNUwqAgMzINCj4+IMKgICMgZGVmaW5lIENP
TkZJR19FRkxBU0hfUFJPVFNFQ1RPUlPCoCAxDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMv
Y29uZmlnX3doaXRlbGlzdC50eHQgYi9zY3JpcHRzL2NvbmZpZ193aGl0ZWxpc3QudHh0DQo+PiBp
bmRleCA3NzI2MjQzZjIyLi4zYTkyM2FiZjdlIDEwMDY0NA0KPj4gLS0tIGEvc2NyaXB0cy9jb25m
aWdfd2hpdGVsaXN0LnR4dA0KPj4gKysrIGIvc2NyaXB0cy9jb25maWdfd2hpdGVsaXN0LnR4dA0K
Pj4gQEAgLTE4LDcgKzE4LDYgQEAgQ09ORklHX0FUOTFTQU05RzIwRUsNCj4+IMKgIENPTkZJR19B
VDkxU0FNOUcyMEVLXzJNTUMNCj4+IMKgIENPTkZJR19BVDkxU0FNOUc0NV9MQ0RfQkFTRQ0KPj4g
wqAgQ09ORklHX0FUOTFTQU05TTEwRzQ1RUsNCj4+IC1DT05GSUdfQVQ5MV9FRkxBU0gNCj4+IMKg
IENPTkZJR19BVDkxX0dQSU9fUFVMTFVQDQo+PiDCoCBDT05GSUdfQVQ5MV9MRUQNCj4+IMKgIENP
TkZJR19BVDkxX1dBTlRTX0NPTU1PTl9QSFkNCj4+DQo+IA0KPiBWaWVsZSBHcsO8w59lLA0KPiBT
dGVmYW4gUm9lc2UNCj4gDQo+IC0tIA0KPiBERU5YIFNvZnR3YXJlIEVuZ2luZWVyaW5nIEdtYkgs
wqDCoMKgwqDCoCBNYW5hZ2luZyBEaXJlY3RvcjogV29sZmdhbmcgRGVuaw0KPiBIUkIgMTY1MjM1
IE11bmljaCwgT2ZmaWNlOiBLaXJjaGVuc3RyLjUsIEQtODIxOTQgR3JvZWJlbnplbGwsIEdlcm1h
bnkNCj4gUGhvbmU6ICgrNDkpLTgxNDItNjY5ODktNTEgRmF4OiAoKzQ5KS04MTQyLTY2OTg5LTgw
IEVtYWlsOiBzckBkZW54LmRlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==

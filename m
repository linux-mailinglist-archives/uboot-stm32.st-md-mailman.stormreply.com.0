Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 364EBF8A69
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 09:20:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0233BC36B0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 08:20:41 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44046C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 07:43:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 23:43:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,295,1569308400"; d="scan'208";a="234767680"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2019 23:43:16 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 11 Nov 2019 23:43:15 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 Nov 2019 23:43:15 -0800
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 11 Nov 2019 23:43:15 -0800
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (104.47.41.55) by
 edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 11 Nov 2019 23:42:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqjjU3kbsCReKDd25DPbNV51lSHyGu0hus/ObYWE4cvxM2IfLkc/Bg2pOUcrT5riQtskQVhATRs3b6yHCjM+8Ie//4slFwhl922MFq2b25zm2EpmzYIln35cztuE4GKe2+Y4s28URBIvvjWeRrMmdhMpLmB+j2wRdGgfbKgz+XzG9YE58XA8q5NhMdlp9kcDCPbH1ZJzEC9inSh408D18BqQOMwL8wGW7fNXnDCRfleuHv8seaLLQz2uqumhHLO+0yuHwF7I7xK8cAjY8Z4+6SfP0O16DJHDr1O6s1ZCS8Qy7FNg8LGi+/wTQ0YkCBHJmiUfDZJxITmdhjBW3UpP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EesQ1uvgwcU1Py5ZGJzS3WuwnehP8026HwnPemGgDCA=;
 b=aG19E0rqYSyeLLztoCeL4PS3CJ+QwBkwiUYPDl1KgYymDEmQ2s1ay8mJuCRVoqfkQ7TuQUN/ZMqH1KF9rmoRR9Kj9G982A5QNx/l9N8zMhRz7nQNILGNtUGuUCXWX/5oUjhw1pHshfE/qSQR5wXdOoxtuzkSIzMhl44OBqAUq0KkRy1iy/sXpxEuWGguGyAKXk3JF6SXQ3xWnMwIwa+JMYoisSBrOOYvWF6dDwMe5KNj0OoF9PaycQh3iRHvTRK7Eh9cugGum0t3tbrxchmAqYI3hWIlG2cLKtaC3xY5Kdx1TohtXwX5G4irNsc/UjCVWUbSJzlTH4SqgoHzsgA1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EesQ1uvgwcU1Py5ZGJzS3WuwnehP8026HwnPemGgDCA=;
 b=kiCbQE4TsEL69W83ove5wIpo06UiX2T9bZ2kI/WMulD/OYRqycYN8Uk42PBNN176d9MVNI7FYNXglWpt16kUjuzQIZzrozrcQfk1OHn2QPiFSNlzt5v8Dh16zFsQeMcJOb6jo872W/iuUu5zNExCS+alTNsNv70pkXZ0+C7lgFw=
Received: from MN2PR11MB4509.namprd11.prod.outlook.com (52.135.39.90) by
 MN2PR11MB4222.namprd11.prod.outlook.com (52.135.36.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Tue, 12 Nov 2019 07:42:46 +0000
Received: from MN2PR11MB4509.namprd11.prod.outlook.com
 ([fe80::b403:c5ba:ab5f:1bd3]) by MN2PR11MB4509.namprd11.prod.outlook.com
 ([fe80::b403:c5ba:ab5f:1bd3%7]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 07:42:46 +0000
From: "Tan, Ley Foon" <ley.foon.tan@intel.com>
To: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 0/4] usb: host: dwc2: use driver model for PHY and
 CLOCK
Thread-Index: AQHVlkvC/W2a3vMrIkK4iCmEuxFIIKeHKCbg
Date: Tue, 12 Nov 2019 07:42:46 +0000
Message-ID: <MN2PR11MB450966FEDD9DF0375BB8FEDECC770@MN2PR11MB4509.namprd11.prod.outlook.com>
References: <20191108144716.23829-1-patrick.delaunay@st.com>
 <507210dc-a047-8f33-873c-fb336e1f8ba0@denx.de>
In-Reply-To: <507210dc-a047-8f33-873c-fb336e1f8ba0@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGRlYmY0YWItZGQ4OC00NzlkLWE3MDYtZWQ2ZTQ5ZjM1MzhkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiKzZTTERrZEJ6ZzhobkIyOVU4cDZrZW43TElnMms0RUlNSkx4ZWp0aHpoNUxzNTc4KzMzcWFDcTBLcDZqTXpsNyJ9
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ley.foon.tan@intel.com; 
x-originating-ip: [192.198.147.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 507fbf8f-cc66-492a-0588-08d76743e90b
x-ms-traffictypediagnostic: MN2PR11MB4222:
x-microsoft-antispam-prvs: <MN2PR11MB4222E649375CD610E388B9DFCC770@MN2PR11MB4222.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(376002)(396003)(39860400002)(346002)(13464003)(199004)(189003)(11346002)(26005)(76176011)(33656002)(6436002)(53546011)(6506007)(76116006)(66066001)(476003)(14444005)(7696005)(66556008)(66446008)(64756008)(102836004)(4326008)(486006)(256004)(446003)(66946007)(66476007)(6246003)(55016002)(71190400001)(186003)(71200400001)(9686003)(316002)(110136005)(74316002)(2906002)(229853002)(8676002)(14454004)(81156014)(305945005)(478600001)(7736002)(81166006)(25786009)(99286004)(2501003)(52536014)(86362001)(5660300002)(6116002)(3846002)(54906003)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR11MB4222;
 H:MN2PR11MB4509.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lUfVbbWo0BbVoQ/z8sMsbwPvTzZWGGkr2g6NjDJ+52W/0/U4j0gC2vuwF70GQBReWawGvXLhIeawGmwpK3BVfXoUCdPguCUk3qvahCyI3zOZ/1k7021D2jOTygVRygfgfOYRMXQtbF4Brz4jw7eQAG/YdVGkuAJcGCl72Ho4QrED+2JSQZgDK3SanbQ5lfhB//7XVSYPAjbRmE3eHVKYYR4mxwnpThQaFi6jep4pb6LR1CGtW5onS6bd1dU85BUcIV+P+wvI/8Qq2ofrJQb/MQ/ZAvWItv2j2jnNPUihb5xQ3i0N8RREbPGFXOaurH2wkUTOs3GjCw1QpKVHFHc5YlO4fxk3b8t45zkphQs8KuWpWC1nJkj2cLe+1psPAWWbhitKW/Nl6rqVxjOhvi0Y/F2eTn55NJRq7y97xYb/BZ9zNLNJ8d9pAarijro98Zlj
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 507fbf8f-cc66-492a-0588-08d76743e90b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 07:42:46.4768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: huK2rjvwd6oLMZGnIplwz1f/jeelv95xxDJk0hxr1gDb3Nrzx7AjU9IOellcOafATmU93HHZFg5m14F3S5AzIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4222
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 12 Nov 2019 08:20:39 +0000
Cc: Bin Meng <bmeng.cn@gmail.com>,
 "simon.k.r.goldschmidt@gmail.com" <simon.k.r.goldschmidt@gmail.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>,
 Sven Schwermer <sven@svenschwermer.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: Re: [Uboot-stm32] [PATCH v2 0/4] usb: host: dwc2: use driver model
 for PHY and CLOCK
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



> -----Original Message-----
> From: Marek Vasut <marex@denx.de>
> Sent: Friday, November 8, 2019 11:43 PM
> To: Patrick Delaunay <patrick.delaunay@st.com>; u-boot@lists.denx.de
> Cc: simon.k.r.goldschmidt@gmail.com; b.galvani@gmail.com; Michal
> Suchanek <msuchanek@suse.de>; Sven Schwermer
> <sven@svenschwermer.de>; U-Boot STM32 <uboot-stm32@st-md-
> mailman.stormreply.com>; Bin Meng <bmeng.cn@gmail.com>; Tan, Ley
> Foon <ley.foon.tan@intel.com>
> Subject: Re: [PATCH v2 0/4] usb: host: dwc2: use driver model for PHY and
> CLOCK
> 
> On 11/8/19 3:47 PM, Patrick Delaunay wrote:
> >
> > In this serie I update the DWC2 host driver to use the device tree
> > information and the associated PHY and CLOCK drivers when they are
> > available.
> 
> I'm kinda on the fence whether to add it into current release or not.
> The patches look generally OK to me.
> 
> Ley, Simon, can you check this on SoCFPGA ?
There is compilation error for Stratix10. Stratix10 doesn't support clock DM framework yet. 
So, this patch needs check for CONFIG_CLK when call to all clock DM functions.

drivers/usb/host/built-in.o: In function `dwc2_usb_remove':
drivers/usb/host/dwc2.c:1441: undefined reference to `clk_disable_bulk'

Tested on Agilex, USB is working fine with this patch.

Regards
Ley Foon

> Bin, can you give it a once-over ?
> 
> If this looks OK to you, I will add it.
> 
> [...]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

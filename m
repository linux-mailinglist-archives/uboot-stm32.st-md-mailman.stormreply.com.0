Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA3835A01F
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 15:41:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF87EC56639;
	Fri,  9 Apr 2021 13:41:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B36B3C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 13:41:43 +0000 (UTC)
IronPort-SDR: 6gryibQty2aP1Hz4wSBQvyXojxiUsuKAZormPN8RX5la7IjDloetKEfpz6zff6s8OfrgPv1lLq
 utSVotijKGCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="279040159"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; d="scan'208";a="279040159"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 06:41:41 -0700
IronPort-SDR: wGGLRq/PxWXoXWpIYdJbiv3g49fQBsYVOdh8ylBPcfYfdpLpP3qf2VH+ueOtzs0tmGgtE0/HXd
 kmR4DHjRdE8A==
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; d="scan'208";a="530998317"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 06:41:38 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1lUrOA-002YVz-Nj; Fri, 09 Apr 2021 16:41:34 +0300
Date: Fri, 9 Apr 2021 16:41:34 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Sean Anderson <seanga2@gmail.com>
Message-ID: <YHBZjtTb+Pmd3J4a@smile.fi.intel.com>
References: <20210409073617.16045-1-patrice.chotard@foss.st.com>
 <20210409073617.16045-2-patrice.chotard@foss.st.com>
 <CAHp75Vd+ROF4B7io5QM=SY8S8hfzYe4DJCkM1h9fHkSMWgF30w@mail.gmail.com>
 <2d124ca6-664d-08b8-909f-1bde35856529@foss.st.com>
 <CAHp75VeA_iT1D5Vyj0L3gaDAYeB1iMZLN+e11rLj39pBMxB9Ag@mail.gmail.com>
 <014a0559-aec0-6a65-77fd-141707a58d7c@foss.st.com>
 <CAHp75VeapNBfb=LbSdhyOt=CAd704khVAsc5wgFUs9-C9+dCuw@mail.gmail.com>
 <1b1695a5-dd8b-b6c9-e04d-910b90ad7257@foss.st.com>
 <d88c5c18-baa2-32cb-8baa-4a2021271ec8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d88c5c18-baa2-32cb-8baa-4a2021271ec8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Herbert Poetzl <herbert@13thfloor.at>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vabhav Sharma <vabhav.sharma@nxp.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/2] cmd: bind: Fix driver binding on a
	device
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

On Fri, Apr 09, 2021 at 09:13:12AM -0400, Sean Anderson wrote:
> On 4/9/21 8:05 AM, Patrice CHOTARD wrote:
> > On 4/9/21 1:01 PM, Andy Shevchenko wrote:
> > > On Fri, Apr 9, 2021 at 1:32 PM Patrice CHOTARD
> > > <patrice.chotard@foss.st.com> wrote:
> > > > On 4/9/21 11:48 AM, Andy Shevchenko wrote:
> > > > > On Fri, Apr 9, 2021 at 12:28 PM Patrice CHOTARD
> > > > > <patrice.chotard@foss.st.com> wrote:
> > > > > > On 4/9/21 11:16 AM, Andy Shevchenko wrote:
> > > > > > > On Fri, Apr 9, 2021 at 10:37 AM Patrice Chotard
> > > > > > > <patrice.chotard@foss.st.com> wrote:

...

> > > > > > > > +                       if (drv) {
> > > > > > > > +                               if (drv == entry)
> > > > > > > > +                                       break;
> > > > > > > 
> > > > > > > > +                       } else {
> > > > > > > > +                               if (!ret)
> > > > > > > > +                                       break;
> > > > > > > > +                       }
> > > > > > > 
> > > > > > > This can be simplified to
> > > > > > > } else if (!ret)
> > > > > > >    break;
> > > > > > 
> > > > > > I know but checkpatch.pl requested it ;-)
> > > > > 
> > > > > You mean it doesn't recognize 'else if' construction? Then it's a bug
> > > > > there for sure.
> > > > > 
> > > > 
> > > > No, i mean checkpath.pl request to put {} on all statements as shown below :
> > > > 
> > > > ./scripts/checkpatch.pl 0001-cmd-bind-Fix-driver-binding-on-a-device.patch
> > > > CHECK: braces {} should be used on all arms of this statement
> > > > #83: FILE: drivers/core/lists.c:228:
> > > > +                       if (drv) {
> > > > [...]
> > > > +                       } else if (!ret)
> > > 
> > > So, you still can put else and if on one line, right?
> > > 
> > 
> > No, if i put else and if on one line as you suggested, checkpatch.pl is complaining as shown above.
> > 
> > Patrice
> > 
> 
> } else if (!ret) {
> 	break;
> }
> 
> ?

Thanks, that's fine for me. Does checkpatch.pl complain on this?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

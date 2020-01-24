Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6891485CF
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 14:17:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F82AC36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 13:17:30 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2986C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 13:17:29 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48406x3bM1z1qr57
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 14:17:29 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48406x34hxz1qwyJ
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 14:17:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024) with ESMTP id 3SQRcKz-oJyH
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 14:17:28 +0100 (CET)
X-Auth-Info: 86x1KrzAceLASIHFHaCSvW82Ham3Xe9DepwSK3uGMac=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 14:17:28 +0100 (CET)
Received: by janitor.denx.de (Postfix, from userid 119)
 id 2AE5BA2C25; Fri, 24 Jan 2020 14:17:28 +0100 (CET)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id 202D4A2B93;
 Fri, 24 Jan 2020 14:17:15 +0100 (CET)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id CE60724065B;
 Fri, 24 Jan 2020 14:17:14 +0100 (CET)
To: Patrick Delaunay <patrick.delaunay@st.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <20200124133332.3.I42c79507524e5ad68e85fd60bbd686c4c59523ae@changeid>
References: <20200124123346.32210-1-patrick.delaunay@st.com>
 <20200124133332.3.I42c79507524e5ad68e85fd60bbd686c4c59523ae@changeid>
Comments: In-reply-to Patrick Delaunay <patrick.delaunay@st.com>
 message dated "Fri, 24 Jan 2020 13:33:44 +0100."
Date: Fri, 24 Jan 2020 14:17:14 +0100
Message-Id: <20200124131714.CE60724065B@gemini.denx.de>
Cc: Leo Ruan <tingquan.ruan@cn.bosch.com>, u-boot@lists.denx.de,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 3/5] cmd: env: check real location for env
	info command
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

Dear Patrick Delaunay,

In message <20200124133332.3.I42c79507524e5ad68e85fd60bbd686c4c59523ae@changeid> you wrote:
> Check the current ENV location, dynamically provided by the weak
> function env_get_location to be sure that the environment can be
> persistent.
>
> The compilation flag ENV_IS_IN_DEVICE is not enough when the board
> dynamically select the available storage location (according boot
> device for example).
>
> This patch solves issue for stm32mp1 platform, when the boot device
> is USB.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  cmd/nvedit.c           | 13 ++++++++++---
>  env/env.c              | 18 ------------------
>  include/env_internal.h | 20 ++++++++++++++++++++
>  3 files changed, 30 insertions(+), 21 deletions(-)
>
> diff --git a/cmd/nvedit.c b/cmd/nvedit.c
> index 3d1054e763..a37b7c094a 100644
> --- a/cmd/nvedit.c
> +++ b/cmd/nvedit.c
> @@ -1269,9 +1269,16 @@ static int do_env_info(cmd_tbl_t *cmdtp, int flag,
>  	/* evaluate whether environment can be persisted */
>  	if (eval_flags & ENV_INFO_IS_PERSISTED) {
>  #if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
> -		if (!quiet)
> -			printf("Environment can be persisted\n");
> -		eval_results |= ENV_INFO_IS_PERSISTED;
> +		enum env_location loc = env_get_location(ENVOP_SAVE,

Please do not declare variables right in the middle of the code!


> +++ b/env/env.c
> @@ -105,24 +105,6 @@ static void env_set_inited(enum env_location location)
>  	gd->env_has_init |= BIT(location);
>  }
>  
> -/**
> - * env_get_location() - Returns the best env location for a board
> - * @op: operations performed on the environment
> - * @prio: priority between the multiple environments, 0 being the
> - *        highest priority
> - *
> - * This will return the preferred environment for the given priority.
> - * This is overridable by boards if they need to.
> - *
> - * All implementations are free to use the operation, the priority and
> - * any other data relevant to their choice, but must take into account
> - * the fact that the lowest prority (0) is the most important location
> - * in the system. The following locations should be returned by order
> - * of descending priorities, from the highest to the lowest priority.
> - *
> - * Returns:
> - * an enum env_location value on success, a negative error code otherwise
> - */
>  __weak enum env_location env_get_location(enum env_operation op, int prio)

I think it is a really bad idea to remove the comment from the
implementation.  Please keep it here.

> --- a/include/env_internal.h
> +++ b/include/env_internal.h
> @@ -209,6 +209,26 @@ struct env_driver {
>  
>  extern struct hsearch_data env_htab;
>  
> +/**
> + * env_get_location() - Returns the best env location for a board
> + * @op: operations performed on the environment
> + * @prio: priority between the multiple environments, 0 being the
> + *        highest priority
> + *
> + * This will return the preferred environment for the given priority.
> + * This is overridable by boards if they need to.
> + *
> + * All implementations are free to use the operation, the priority and
> + * any other data relevant to their choice, but must take into account
> + * the fact that the lowest prority (0) is the most important location
> + * in the system. The following locations should be returned by order
> + * of descending priorities, from the highest to the lowest priority.
> + *
> + * Returns:
> + * an enum env_location value on success, a negative error code otherwise
> + */
> +enum env_location env_get_location(enum env_operation op, int prio);

If absolutely necessary, copuy only what is needed for API
documentation.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"This is a test of the Emergency Broadcast System. If this had been an
actual emergency, do you really think we'd stick around to tell you?"
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

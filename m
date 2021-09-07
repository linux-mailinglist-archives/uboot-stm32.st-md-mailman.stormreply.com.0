Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE7A4031AE
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Sep 2021 01:59:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42568C5A4F6;
	Tue,  7 Sep 2021 23:59:45 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 359A2C5A4D8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 23:59:43 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id m21so431834qkm.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Sep 2021 16:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hD1glrFe2f3M42mjA0Ks0yVEAoqE0B0Q78UH9jCi99A=;
 b=qnJD6IViSenjFh9WerYv+XnpgYJSoGbFtHfRL347E87QntiFEUvnui1Galaejxn6xj
 friYeC6ttVav5cqgJpIHnRI/mhPmfldyXjyl0GTay3EDzFtHw3eKxwOIz6S/3nuAgbct
 bWP8c8LAVnowH2Sxxa5hO7XP9+tHMQjK32Bok3k/5js02btLzk2ihqMcN6/sjl/wueUS
 8e9ix/cA22I+pDqxez2G24+rWQZtxsFkRD390nBuiB4fDxbKKFWcoVXjhaNtN4lQtAQe
 ufo/8sw8oOAmXe2cE+oXP0deFzTC47NgzqDHds9aR5haH2vfQUVWqtf7H/1fJKSfzwMl
 uGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hD1glrFe2f3M42mjA0Ks0yVEAoqE0B0Q78UH9jCi99A=;
 b=Y54I3BDbFvY9Ras8SxLl6K6w8TdjEeeRUVaQJll3N0JgMY0Py3aHHlyLjzugDGyl3D
 9Z+3muIGEO3PdWi4Gb6lt/oVMegLc+HRGaY+e/HUGl3Sbx77C+vj0tiq3bJQZF/1rV1Y
 qJPOu2DlpcfXh6txKnmlUmTSX8Fy7vfXbZK1I1RFr4WVAGeT5iM3N8K+PtfcmeaxdM2q
 UcMtklV4e6a84NnL8MPWct0PAbNsX3zw8yLuwJpS94OacpX/203GSyiaG3dNfyjkcp49
 135ncjroO4chr/Sc/OOg81gyYS7D48t764H8BmRNpOP2Jgr/wLlfybD65yiaPikCYunc
 yGQQ==
X-Gm-Message-State: AOAM530ELG9OJZ6eEHoq6MYj+EB6PuwduAC2IfF9LaCEO2vii1JpW+95
 cpNf9RE6P5YVRuJ+ddL6uxk=
X-Google-Smtp-Source: ABdhPJwrh7WKLN3zfWKDzxUo/5AqDbrxYtFsfaXW3CBC27pc2AClHglLtpEgwVVON2qMQ7ly93RBJw==
X-Received: by 2002:a05:620a:1453:: with SMTP id
 i19mr895009qkl.40.1631059182254; 
 Tue, 07 Sep 2021 16:59:42 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id d78sm460351qkg.92.2021.09.07.16.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 16:59:41 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Tue,  7 Sep 2021 18:59:27 -0500
Message-Id: <20210907235933.2798330-6-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
References: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 05/11] fdt_support: Implement
	fdt_ethernet_set_macaddr()
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

Oftentimes we have MAC address information stored in a ROM or OTP. The
way to add that to the FDT would be through the u-boot environment,
and then fdt_fixup_ethernet(). This is not very useful in SPL.

It would be more helpful to be able to "set interface x to MAC y".
This is where fdt_ethernet_set_macaddr() comes in. It is similar in
function to fdt_fixup_ethernet(), but only updates one interface,
without using the u-boot env, and without string processing.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 common/fdt_support.c  | 30 ++++++++++++++++++++++++++++++
 include/fdt_support.h | 17 +++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/common/fdt_support.c b/common/fdt_support.c
index 8992ac5d3f..1c43640cf7 100644
--- a/common/fdt_support.c
+++ b/common/fdt_support.c
@@ -610,6 +610,36 @@ void fdt_fixup_ethernet(void *fdt)
 	}
 }
 
+int fdt_ethernet_set_macaddr(void *fdt, int ethnum, const uint8_t *mac_addr)
+{
+	const char *path, *name;
+	int prop, aliases_node;
+	char eth_name[16] = "ethernet";
+
+	aliases_node = fdt_path_offset(fdt, "/aliases");
+	if (aliases_node < 0)
+		return aliases_node;
+
+	if (ethnum >= 0)
+		sprintf(eth_name, "ethernet%d", ethnum);
+
+	fdt_for_each_property_offset(prop, fdt, aliases_node) {
+		path = fdt_getprop_by_offset(fdt, prop, &name, NULL);
+		if (!strcmp(name, eth_name))
+			break;
+
+		path = NULL;
+	}
+
+	if (!path)
+		return -FDT_ERR_NOTFOUND;
+
+	do_fixup_by_path(fdt, path, "mac-address", mac_addr, 6, 0);
+	do_fixup_by_path(fdt, path, "local-mac-address", mac_addr, 6, 1);
+
+	return 0;
+}
+
 int fdt_record_loadable(void *blob, u32 index, const char *name,
 			uintptr_t load_addr, u32 size, uintptr_t entry_point,
 			const char *type, const char *os, const char *arch)
diff --git a/include/fdt_support.h b/include/fdt_support.h
index f6f46bb8e9..3f0bcb5a00 100644
--- a/include/fdt_support.h
+++ b/include/fdt_support.h
@@ -119,6 +119,23 @@ static inline int fdt_fixup_memory_banks(void *blob, u64 start[], u64 size[],
 #endif
 
 void fdt_fixup_ethernet(void *fdt);
+
+/**
+ * Set the "mac-address" and "local-mac-address" of ethernet node
+ * The ethernet node is located from the "/aliases" section of the fdt. When
+ * 'ethnum' is positive, then the name is matched exactly, e.g "ethernet0".
+ * When ethnum is negative, the first ethernet alias is updated.
+ * Unlike fdt_fixup_ethernet(), this function only updates one ethernet node,
+ * and soes not use the "ethaddr" from the u-boot environment. This is useful,
+ * for example, in SPL, when the environment is not initialized or available.
+ *
+ * @param fdt		FDT blob to update
+ * @param ethnum	Ethernet device index, or negative for any ethernet
+ * @param mac_addr	Pointer to 6-byte array containing the MAC address
+ *
+ * @return 0 if ok, or -FDT_ERR_... on error
+ */
+int fdt_ethernet_set_macaddr(void *fdt, int ethnum, const uint8_t *mac_addr);
 int fdt_find_and_setprop(void *fdt, const char *node, const char *prop,
 			 const void *val, int len, int create);
 void fdt_fixup_qe_firmware(void *fdt);
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
